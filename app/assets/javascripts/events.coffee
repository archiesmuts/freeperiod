# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Usage together with TurboLinks (version 5)
# Using turbolinks requires special care for loading and unloading FullCalendar. You have to load your calendars in a good manner, with Turbolinks 5 you need to remove Fullcalendar from a before_cache tag.

eventCalendar = ->
  $('#event_calendar').fullCalendar
    events: 'events.json'
    editable: false
    header:
      left: 'prev,next today'
      center: 'title'
      right: 'month,agendaWeek,agendaDay,listMonth'
    defaultView: 'month'
    # height: 500
    slotMinutes: 15
    eventLimit: true
    eventRender: (event, element) ->
      element.attr 'href', 'javascript:void(0);'
      element.click ->
        $('.modal-title').html event.title
        $('.modal-body').html moment(event.start).format('MMM Do h:mm A') + ' to ' + moment(event.end).format('MMM Do h:mm A') + '<br />' + event.description
        # changed the attr replacement with the following
        # $('#eventLink').click ->
        #   window.location = event.url
        $('#fullCalModal').modal()

clearCalendar = ->
  $('#event_calendar').fullCalendar 'delete'
  # In case delete doesn't work.
  $('#event_calendar').html ''

jQuery(document).on 'turbolinks:load', eventCalendar
jQuery(document).on 'turbolinks:before-cache', clearCalendar

jQuery(document).on "turbolinks:load", ->
  $('#event_start_time').datetimepicker
  $('.datepicker').datepicker
    changeMonth: true
    changeYear: true
    dateFormat: "yy-mm-dd"
  $('#event-dialog').on 'shown.bs.modal', ->
    $('.datepicker').datepicker
      changeMonth: true
      changeYear: true
      dateFormat: "yy-mm-dd"
