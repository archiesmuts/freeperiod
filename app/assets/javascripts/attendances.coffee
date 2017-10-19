# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.countDaysAbsent = ->
  number_days = $("#list-attendances").children().length
  $("#days-absent").text number_days

jQuery(document).on "turbolinks:load", ->
  $("#list-attendances").countDaysAbsent()
  $('#attendance-dialog').on 'shown.bs.modal', ->
    $('.datepicker').datepicker
      changeMonth: true
      changeYear: true
      dateFormat: "yy-mm-dd"
