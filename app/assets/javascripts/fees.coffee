# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on "turbolinks:load", ->
  $('#fee-dialog').on 'shown.bs.modal', ->
    $('.fee_name').focus() # for modal forms the selectors should be classes

  $('#fee_name').focus() # for normal forms i.e. not in modals, the selectors can be ids

  $('#checkAll').click ->
    $('.fee-box').prop 'checked', $(this).prop('checked')
  $('.form-check-input').change ->
    if !jQuery(this).prop('checked')
      $('#checkAll').prop 'checked', false
