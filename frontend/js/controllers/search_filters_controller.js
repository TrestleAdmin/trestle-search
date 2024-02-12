/* global Trestle */

export default class extends Trestle.Controllers.popover {
  initialize () {
    super.initialize()

    this.boundPersistFormState = this.persistFormState.bind(this)
  }

  connect () {
    super.connect()

    this.element.addEventListener('hide.bs.popover', this.boundPersistFormState)
  }

  disconnect () {
    super.disconnect()

    this.element.removeEventListener('hide.bs.popover', this.boundPersistFormState)
  }

  get popoverOptions() {
    return {
      ...super.popoverOptions,
      customClass: 'search-filters-popover',
      animation: false,
      html: true,
      sanitize: false,
      placement: 'bottom',
      container: this.container,
      content: () => this.content
    }
  }

  clickWithinPopover (e) {
    return super.clickWithinPopover(e) || this.clickWithinCalendar(e)
  }

  clickWithinCalendar (e) {
    return !!e.target.closest('.flatpickr-calendar')
  }

  get container () {
    return document.querySelector('.search-filters form')
  }

  get content () {
    if (!this.contentFragment) {
      this.contentFragment = document.createRange().createContextualFragment(this.contentTemplate.innerHTML)
    }

    return this.contentFragment
  }

  get contentTemplate () {
    return document.getElementById('search-filters')
  }

  persistFormState (e) {
    if (this.popover.tip) {
      const body = this.popover.tip.querySelector('.popover-body')

      const form = new DocumentFragment()
      form.append(...body.childNodes)
      this.contentFragment = form
    }
  }
}
