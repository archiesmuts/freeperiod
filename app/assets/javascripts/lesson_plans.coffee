# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.sizeLessonPlans = ->
  size_lesson_plans = $("#list-lesson-plans").children(".lesson-plan-card").length
  $("#sizeLessonPlans1").text size_lesson_plans
  $("#sizeLessonPlans2").text size_lesson_plans

jQuery(document).on "turbolinks:load", ->
  $("#list-lesson-plans").sizeLessonPlans()
