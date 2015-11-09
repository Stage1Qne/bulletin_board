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

  # --- Start js-delete-record-btn
  $('.js-delete-record-btn').click ->
    result = window.confirm('The record will be removed')
    if result == true
      item_id = $(this).data('record-id')
      fullpath = $(this).data('fullpath') + '/'
      $.ajax
        type: 'POST'
        url: fullpath + item_id
        dataType: 'json'
        data:
          _method: 'delete'

        complete: ->
          $(".js-record[data-id=#{item_id}]").fadeOut(300)
  # --- End js-delete-record-btn
  # --- End buttons

$(document).ready(ready)
$(document).on('page:load', ready)
