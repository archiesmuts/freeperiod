# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.calcDiscountedFee = ->
  approvedFee = $("#approvedFee").val()
  percentDiscount = $("#pay_agreement_discount").val()
  discountAmount = parseFloat(approvedFee) * parseFloat(percentDiscount)/100
  discountedFee = parseFloat(approvedFee) - parseFloat(discountAmount)
  $("#discountedFee").text parseFloat(discountedFee)
  $("#discountAmount").text parseFloat(discountAmount)

jQuery(document).on "turbolinks:load", ->
  $('.pay-agreement-user-registration-id').hide()
  $('#calculateDiscount').click (e) ->
    e.preventDefault
    $("#edit_pay_agreement").calcDiscountedFee()
