# fadeOut for flash-alert messages
jQuery(document).on "turbolinks:load", ->
  setTimeout (->
    $('.flash-alert').fadeOut 'slow'
    return
  ), 3000

# $(document).on 'turbolinks:load', ->
#   $('.alert').delay(5000).slideUp 500, ->
#     $('.alert').alert 'close'
