# // # Place all the behaviors and hooks related to the matching controller here.
# // # All this logic will automatically be available in application.js.
# // # You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.submitOnCheck = ->
  @find('input[type=checkbox]').click ->
    $(this).closest('form').submit()
  this

document.addEventListener 'turbolinks:load', ->
  $('#list-action-plans').sortable update: (e, ui) ->
    Rails.ajax
      url: $(this).data('url')
      type: 'PATCH'
      data: $(this).sortable('serialize')
    return
  $('#list-action-plans').disableSelection()
  return

$(document).on "turbolinks:load", ->
  $('#list-action-plans').sortable
    placeholder: "list-group-item list-group-item-warning"
    handle: '.handle'

  $('.edit_action_plan').submitOnCheck()
