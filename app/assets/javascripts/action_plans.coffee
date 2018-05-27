# // # Place all the behaviors and hooks related to the matching controller here.
# // # All this logic will automatically be available in application.js.
# // # You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.submitOnCheck = ->
  @find('input[type=checkbox]').click ->
    $(this).closest('form').submit()
  this

jQuery.fn.sizeTasks = ->
  size_tasks = $("#list-action-plans").find(".fa-check-square").length
  $("#sizeTasks").text size_tasks

jQuery.fn.sizeActions = ->
  size_action_plans = $("#list-action-plans").find(".fa-calendar-check").length
  $("#sizeActionPlans1").text size_action_plans
  $("#sizeActionPlans2").text size_action_plans
  $("#sizeActionPlans3").text size_action_plans

jQuery.fn.sizeCompleted = ->
  size_completed = $("#list-action-plans").find("input:checked").length
  $("#sizeCompleted").text size_completed

document.addEventListener 'turbolinks:load', ->
  $('#list-action-plans').sortable update: (e, ui) ->
    Rails.ajax
      url: $(this).data('url')
      type: 'PATCH'
      data: $(this).sortable('serialize')
  $('#list-action-plans').disableSelection()

$(document).on "turbolinks:load", ->
  $('#list-action-plans').sortable
    placeholder: "list-group-item list-group-item-warning"

  $('.edit_action_plan').submitOnCheck()
  $("#list-action-plans").sizeTasks()
  $("#list-action-plans").sizeActions()
  $("#list-action-plans").sizeCompleted()

  $('#action-plan-dialog').on 'shown.bs.modal', ->
    $('.action_plan_what').focus()
    $('.datetimepicker').datetimepicker
      format: "YYYY-MM-DD"
