# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.getTotal = ->
  total = 0
  $('.partValue').each ->
    total += parseFloat(@innerHTML)
  total

  $('#totalValue').text total

jQuery.fn.sizeParts = ->
  size_parts = $("#list-parts").find(".part-card").length
  $("#sizeParts1").text size_parts
  $("#sizeParts2").text size_parts

jQuery.fn.sizeResults = ->
  size_results = $("#list-results").find(".result-card").length
  $("#sizeResults1").text size_results
  $("#sizeResults2").text size_results


jQuery(document).on "turbolinks:load", ->
  $('#assessmentStats').getTotal()
  $('#list-parts').sizeParts()
  $('#list-results').sizeResults()

  $('#part-dialog').on 'shown.bs.modal', ->
    $('.part_name').focus()
