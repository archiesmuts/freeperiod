# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.sizeAchievements = ->
  size_achievements = $("#list-achievements").children().length
  $("#sizeAchievements1").text size_achievements
  $("#sizeAchievements2").text size_achievements

jQuery(document).on "turbolinks:load", ->
  $("#list-achievements").sizeAchievements()
  $('#achievement_title').focus()
  $('#achievement_date').datetimepicker
    format: "YYYY-MM-DD"

  $('#achievement-dialog').on 'shown.bs.modal', ->
    $('#achievement_title').focus()
    $('.datetimepicker').datetimepicker
      format: "YYYY-MM-DD"
