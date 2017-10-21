# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $('#assessment_name').focus()
  $('#assessment_assessment_task_id').parent().hide()
  assessment_tasks = $('#assessment_assessment_task_id').html()
  $('#assessment_assessment_type_id').change ->
    assessment_type = $('#assessment_assessment_type_id :selected').text()
    options = $(assessment_tasks).filter("optgroup[label='#{assessment_type}']").html()
    if options
      $('#assessment_assessment_task_id').html(options)
      $('#assessment_assessment_task_id').parent().show()
    else
      $('#assessment_assessment_task_id').empty()
      $('#assessment_assessment_task_id').parent().hide()
