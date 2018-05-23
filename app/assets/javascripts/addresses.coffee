# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.sizeAddresses = ->
  size_addresses = $("#list-addresses").children(".address-card").length
  $("#sizeAddresses1").text size_addresses
  $("#sizeAddresses2").text size_addresses

jQuery(document).on "turbolinks:load", ->
  $("#list-addresses").sizeAddresses()



# $(document).on "turbolinks:load", ->
#   $('#add-address-link').click (event) ->
#     event.preventDefault()
#     $('#geo-input-row').fadeToggle("slow")
#     $('#new_address').fadeToggle("slow")
#     $('.map-canvas').fadeToggle("slow")
#     $('#geo-input').focus()
#     $('#geo-input').val("")
#     $('#address_street').val("")
#     $('#address_postal').val("")
#     $('#address_phone_1').val("")
#     $('#address_phone_2').val("")
#
#   $("#geo-input").geocomplete
#     map: ".map-canvas"
#     mapOptions:
#       zoom: 5
#     details: "form"
#     detailsAttribute: "data-geo"
#
#   # Trigger geocoding rquest.
#   $('button.find').click ->
#     $('input').trigger 'geocode'
