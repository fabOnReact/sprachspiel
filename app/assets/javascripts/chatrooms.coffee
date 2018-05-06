$(document).on 'turbolinks:load', ->
  submitNewMessage()

submitNewMessage = -> 
  $('textarea#message_content').keydown event, ->
    if event.keyCode == 13
      $('[data-send="message"]').click()
      $('[data-textarea="message"]').val(" ")        
      return false