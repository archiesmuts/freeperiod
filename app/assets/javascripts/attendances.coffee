# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.countDaysAbsent = ->
  number_days = $("#list-attendances").children(".attendance-card").length
  $("#daysAbsent1").text number_days
  $("#daysAbsent2").text number_days

jQuery(document).on "turbolinks:load", ->
  $("#list-attendances").countDaysAbsent()
  $('#attendance-dialog').on 'shown.bs.modal', ->
    $('.datetimepicker').datetimepicker
