$(document).on 'turbolinks:load', ->
  $('[data-id="chatroom-input"]').keydown (event) ->
    if event.key == "Enter"
      $('[data-send="message"]').click()
      $('[data-textarea="message"]').val(" ")
