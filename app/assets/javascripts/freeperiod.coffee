$(document).on "turbolinks:load", ->

  $('body').prepend '<a href="#" class="back-to-top"></a>'

  amountScrolled = 350
  $(window).scroll ->
    if $(window).scrollTop() > amountScrolled
      $('a.back-to-top').fadeIn 'slow'
    else
      $('a.back-to-top').fadeOut 'slow'
    return

  $('a.back-to-top').click ->
    $('html, body').animate { scrollTop: 0 }, 700
    false

  didScroll = undefined
  lastScrollTop = 0
  delta = 5
  navbarHeight = $('nav').outerHeight()

  hasScrolled = ->
    st = $(this).scrollTop()
    # Make sure they scroll more than delta
    if Math.abs(lastScrollTop - st) <= delta
      return
    # If they scrolled down and are past the navbar, add class .nav-up.
    # This is necessary so you never see what is "behind" the navbar.
    if st > lastScrollTop and st > navbarHeight
      # Scroll Down
      $('nav').removeClass('nav-down').addClass 'nav-up'
    else
      # Scroll Up
      if st + $(window).height() < $(document).height()
        $('nav').removeClass('nav-up').addClass 'nav-down'
    lastScrollTop = st
    return

  $(window).scroll (event) ->
    didScroll = true
    return
  setInterval (->
    if didScroll
      hasScrolled()
      didScroll = false
    return
  ), 250

  Holder.run()

  $('[data-toggle="tooltip"]').tooltip()
