import Trestle from 'trestle'
import $ from 'jquery'

const TEMPLATE = `
  <div class="popover search-filters-popover" role="tooltip">
    <div class="arrow"></div>
    <div class="popover-body"></div>
  </div>`

Trestle.ready(function () {
  const state = $($('#search-filters').html())

  $('[data-toggle="search-filters"]').popover({
    html: true,
    sanitize: false,
    placement: 'bottom',
    container: '.search-filters form',
    animation: false,
    template: TEMPLATE,
    content: function () {
      Trestle.triggerInit(state)
      return state
    }
  })
})

$(document).on('mousedown', function (e) {
  const trigger = $('[data-toggle="search-filters"]')
  const popover = $('.search-filters-popover')

  if (popover.length) {
    // Search filters popover is open
    const clickTarget = $(e.target)

    const flatpickr = $('.flatpickr-calendar')

    // Hide the popover unless clicking within the popover,
    // the popover trigger or a flatpickr calendar
    if (!clickTarget.closest(popover).length &&
        !clickTarget.closest(trigger).length &&
        !clickTarget.closest(flatpickr).length) {
      trigger.popover('hide')
    }
  }
})
