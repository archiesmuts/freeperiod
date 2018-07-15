# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.changeColorOnCheck = ->
  $('.collection-check-boxes').on 'click', 'input:checkbox', ->
    $(this).parent().toggleClass 'checked-label-color', @checked

  boxes = $('input[type="checkbox"]:checked');
  boxes.each ->
    $(this).addClass 'checked-label-color'

# Note that target elements are all classes specifically for modals
jQuery(document).on "turbolinks:load", ->
  # for normal forms i.e. not in modals
  $('#registration_klass_name').focus()
  $('#registration_klass_course_name').autocomplete
    source: $('#registration_klass_course_name').data('autocomplete-source')
    minLength: 2

  $(".list-registration-checkboxes").changeColorOnCheck()

  $('#list_teachers_check_boxes').hide()

  $('[name="group-type"]').on 'click', ->
    if $(this).is('#registration')
      value = $(this).val()
      $("#registration_klass_data_group_type").val(value)
      $('#list_teachers_radio_buttons').show()
      $('#list_teachers_check_boxes').hide()
    else if $(this).is('#subject')
      value = $(this).val()
      $("#registration_klass_data_group_type").val(value)
      $('#list_teachers_radio_buttons').show()
      $('#list_teachers_check_boxes').hide()
    else if $(this).is('#faculty')
      value = $(this).val()
      $("#registration_klass_data_group_type").val(value)
      $('#list_teachers_radio_buttons').hide()
      $('#list_teachers_check_boxes').show()
    else if $(this).is('#admin')
      value = $(this).val()
      $("#registration_klass_data_group_type").val(value)
      $('#list_teachers_check_boxes').show()
      $('#list_teachers_radio_buttons').hide()

  $('#checkAll').click ->
    $('.box').prop 'checked', $(this).prop('checked')
  $('.form-check-input').change ->
    if !jQuery(this).prop('checked')
      $('#checkAll').prop 'checked', false
