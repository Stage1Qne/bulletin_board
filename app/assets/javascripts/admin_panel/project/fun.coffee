ready = ->
  # --- Start nav menu
  $('.js-admin-nav-link').click ->
    $this = $(this)
    unless $this.hasClass('active')
      $('.js-admin-nav-link').removeClass('active')
      $this.addClass('active')
      $this.children('i').removeClass().addClass('spinner loading icon')
  # --- End menu

  # --- Start form-send-btn
  $('.js-form-send-btn').click ->
    $(this).parent('form').addClass('loading')
  # --- End form-send-btn

$(document).ready(ready)
$(document).on('page:load', ready)
