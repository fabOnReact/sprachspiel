$(document).on 'turbolinks:load', ->
  @chatroom = new Chatroom
  $('[data-id="chatroom-input"]').keydown (event) ->
    if event.key == "Enter"
      $('[data-send="message"]').click()
      $('[data-textarea="message"]').val(" ")
      
class @Chatroom
  constructor: ->
    @submit = $('[data-id="chatroom-input"]')
    @scrollbar = $('[data-id="scroll-bar"]')
    @scrollDownChat()
  scrollDownChat: ->
    height = @scrollbar[0].scrollHeight
    @scrollbar.scrollTop(height)
  hasMessage: ->
    @submit.length != 0
