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
    $this = $(this)
    $this.parent('.ui.form').addClass('loading')
    form_id = $this.parents('form').attr('id')
    ajax_form(form_id)
  # --- End form-send-btn

  # --- Start js-delete-record-btn
  $('.js-delete-record-btn').click ->
    return if window.confirm('The record will be removed') == false

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


# --- Start forms
ajax_form = (form_id) ->
  $form = $("##{form_id}")
  return unless $form

  $form.on 'ajax:success', (e, data) ->
    console.log(data)
    $form.find('.ui.form').removeClass('loading')
    $form.clear_form_errors()

  $form.on 'ajax:error', (e, data, status, xhr) ->
    console.log(data)
    $form.find('.ui.form').removeClass('loading')
    $form.render_form_errors($form.data('model-name'), data.responseJSON)


$.fn.render_form_errors = (model_name, errors) ->
  form = this
  this.clear_form_errors()

  $.each errors, (field, messages) ->
    input = form.find('input, select, textarea').filter ->
      name = $(this).attr('name')
      if name
        name.match(new RegExp(model_name + '\\[' + field + '\\(?'))
    input.closest('.field').addClass('error')

$.fn.clear_form_errors = () ->
  this.find('.field').removeClass('error')
# --- End forms
