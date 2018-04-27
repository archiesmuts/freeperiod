# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on "turbolinks:load", ->
  mismatch_alert = $("#user-role-type-mismatch-alert")
  hide_alert = mismatch_alert.hide()
  show_alert = mismatch_alert.show()
  user_type_display = $("#user-type").text()
  user_role_display = $("#user-role").text()
  action = switch
    when user_type_display == "Learner" && user_role_display == "educator" then show_alert
    else hide_alert
