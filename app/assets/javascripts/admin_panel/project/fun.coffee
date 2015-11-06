ready = ->
  # --- Start nav menu
  $('.js-admin-panel-nav-link').click ->
    $this = $(this)
    return if $this.hasClass('active')
    $('.js-admin-panel-nav-link').removeClass('active')
    $this.addClass('active')
    $this.children('i').removeClass().addClass('spinner loading icon')
  # --- End menu

  # --- Start buttons
  $('.js-loading-btn').click -> $(this).addClass('loading')

  # --- Start form-send-btn
  $('.js-form-send-btn').click ->
    $(this).parent('form').addClass('loading')
  # --- End form-send-btn

  # --- End buttons

$(document).ready(ready)
$(document).on('page:load', ready)
