# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on "turbolinks:load", ->
  do ->
    'use strict'
    treeviewMenu = $('.app-menu')
    # Toggle Sidebar
    $('[data-toggle="sidebar"]').click (event) ->
      event.preventDefault()
      $('.app').toggleClass 'sidenav-toggled'
      return
    # Activate sidebar treeview toggle
    $('[data-toggle=\'treeview\']').click (event) ->
      event.preventDefault()
      if !$(this).parent().hasClass('is-expanded')
        treeviewMenu.find('[data-toggle=\'treeview\']').parent().removeClass 'is-expanded'
      $(this).parent().toggleClass 'is-expanded'
      return
    # Set initial active toggle
    $('[data-toggle=\'treeview.\'].is-expanded').parent().toggleClass 'is-expanded'
    #Activate bootstrip tooltips
    $('[data-toggle=\'tooltip\']').tooltip()
    return



      # do (document) ->
      #   div = document.getElementById('container')
      #   icon = document.getElementById('icon')
      #   open = false
      #   div.addEventListener 'click', ->
      #     if open
      #       icon.className = 'fa fa-arrow-down'
      #     else
      #       icon.className = 'fa fa-arrow-down open'
      #     open = !open
