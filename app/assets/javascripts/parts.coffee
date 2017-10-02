# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on "turbolinks:load", ->
  getTotal = ->
    total = 0
    $('.partValue').each ->
      total += parseFloat(@innerHTML)
      return
    total

  $('#totalValue').text getTotal()
