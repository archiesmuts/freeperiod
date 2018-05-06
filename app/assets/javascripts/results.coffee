# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.calcPercentages = ->
  valAssessment = $("#valAssessment").val()
  valMark = $("#result_student_score").val()
  valGoal = $("#valGoal").val()

  pctMark = parseFloat(valMark) / parseFloat(valAssessment) * 100
  pctMarkInput = $("#pctMarkInput")
  pctMarkInput.val(pctMark)

  pctGoal = parseFloat(valGoal) / parseFloat(valAssessment) * 100
  pctGoalInput = $("#pctGoalInput")
  pctGoalInput.val(pctGoal)

jQuery(document).on "turbolinks:load", ->
  $('#calcPctMark, #calcPctGoal').click (e) ->
    e.preventDefault
    $("#edit_pay_agreement").calcPercentages()
