# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery.fn.sizeComments = ->
  size_comments = $("#list-comments").children().length
  $("#sizeComments").text size_comments
  $("#sizeGoalComments").text size_comments

jQuery(document).on "turbolinks:load", ->
  $("#list-comments").sizeComments()
  $(".comment_comment").focus()
  $(".comment_comment").val("")
