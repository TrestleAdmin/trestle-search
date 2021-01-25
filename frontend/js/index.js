import Trestle from 'trestle'
import $ from 'jquery'

Trestle.init(function (root) {
  $(root).find('[data-toggle="search-filters"]').popover({
    html: true,
    sanitize: false,
    placement: 'bottom',
    container: '.search-filters form',
    animation: false,
    template: '<div class="popover search-filters-popover" role="tooltip"><div class="arrow"></div><div class="popover-body"></div></div>',
    content: function () {
      const template = $('#search-filters').html()

      const result = $(template)
      Trestle.triggerInit(result)

      return result
    }
  })
})

$(document).on('click', function (e) {
  const trigger = $('[data-toggle="search-filters"]')
  const popover = $('.search-filters-popover')

  if (popover.length) {
    const clickTarget = $(e.target)

    if (!clickTarget.closest(popover).length && !clickTarget.closest(trigger).length) {
      trigger.popover('hide')
    }
  }
})
