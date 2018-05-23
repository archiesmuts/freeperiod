# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.sizeGoals = ->
  size_goals = $("#list-goals").children(".goal-card").length
  $("#sizeGoals1").text size_goals
  $("#sizeGoals2").text size_goals

jQuery.fn.shuffleCards = ->
    parent = $('#shuffle')
    divs = parent.children()
    while divs.length
      parent.append divs.splice(Math.floor(Math.random() * divs.length), 1)[0]

jQuery(document).on "turbolinks:load", ->
  $('.datetimepicker').datetimepicker
    format: "YYYY-MM-DD"
  $("#list-goals").sizeGoals()

  $("#doTheShuffle").click ->
    $("#shuffle").shuffleCards()
    $('#dice').toggleClass 'flip-icon-180'

  $('#goal-dialog').on 'shown.bs.modal', ->
    $('.goal_name').focus()
    $('.datetimepicker').datetimepicker
      format: "YYYY-MM-DD"
