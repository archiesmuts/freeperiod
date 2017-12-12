# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.sizeGoals = ->
  size_goals = $("#list-goals").children().length
  $("#sizeGoals").text size_goals

jQuery(document).on "turbolinks:load", ->
  $("#list-goals").sizeGoals()
  
  $('#goal-dialog').on 'shown.bs.modal', ->
    $('.goal_name').focus()
    $('.datetimepicker').datetimepicker
      format: "YYYY-MM-DD"
