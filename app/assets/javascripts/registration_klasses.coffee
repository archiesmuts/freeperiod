# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Note that target elements are all classes specifically for modals
jQuery(document).on "turbolinks:load", ->
  $('#registration-klass-dialog').on 'shown.bs.modal', ->
    $('.regklass_course_name').focus()
    $('.regklass_course_name').autocomplete
      source: $('.regklass_course_name').data('autocomplete-source')
      appendTo: "#registration-klass-dialog" #this is required to ensure the list is visible
      minLength: 2
# for normal forms i.e. not in modals
  $('#registration_klass_course_name').focus()
  $('#registration_klass_course_name').autocomplete
    source: $('#registration_klass_course_name').data('autocomplete-source')
    minLength: 2
