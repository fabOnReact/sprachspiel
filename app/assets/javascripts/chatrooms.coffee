$(document).on 'turbolinks:load', ->
  new Chatroom().scrollDownChat()
  $('[data-id="chatroom-input"]').keydown (event) ->
    @chatroom = new Chatroom
    if event.key == "Enter" && @chatroom.hasMessage()
      @chatroom.sendMessage()

class @Chatroom
  constructor: (@data) ->
    @submit= $('[data-send="message"]')
    @textarea = $('[data-textarea="message"]')
    @input = $('[data-id="chatroom-input"]')
    @scrollbar = $('[data-id="scroll-bar"]')
    new Message(@data) if @data?
  sendMessage: ->
    @submit.click()
    @textarea.val("")
    return false
  scrollDownChat: ->
    if @scrollbar?
      height = @scrollbar[0].scrollHeight
      @scrollbar.scrollTop(height)
  hasMessage: ->
    @input.val().trim() != ""
