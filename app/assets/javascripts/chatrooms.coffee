$(document).on 'turbolinks:load', ->
  new Chatroom().scrollDownChat().recordKeyDown()

class @Chatroom
  constructor: (@data) ->
    @submit= $('[data-send="message"]')
    @textarea = $('[data-textarea="message"]')
    @input = $('[data-id="chatroom-input"]')
    @scrollbar = $('[data-id="scroll-bar"]')
    console.log "hello bro!"
    new Message(@data) if @data?
  recordKeyDown: ->
    @input.keydown (event) =>
      if event.key == "Enter" && @hasMessage()
        @sendMessage()
    return this
  sendMessage: ->
    @submit.click()
    @textarea.val("")
    return false
  scrollDownChat: ->
    if @scrollbar?
      height = @scrollbar[0].scrollHeight
      @scrollbar.scrollTop(height)
    return this
  hasMessage: ->
    @input.val().trim() != ""
