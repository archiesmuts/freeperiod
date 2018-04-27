# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on "turbolinks:load", ->
  $('#membership_school_name').autocomplete
    source: $('#membership_school_name').data('autocomplete-source')

  $('#membership_user_name').autocomplete
    source: $('#membership_user_name').data('autocomplete-source')

  $('.membership_user_name').hide()
  $('#alert-account-owner').hide()

  $('[name="membership[member]"]').on 'click', ->
    if $(this).val() == 'account_owner'
      $('#alert-account-owner').show()
    else
      $('#alert-account-owner').hide()
