$(document).on 'turbolinks:load', ->
  new Message()

class Message
 constructor: -> 
    @submit = $('[data-id="chatroom-input"]')
    @scrollbar = $('[data-id="scroll-bar"]')
    unless @submit.length == 0 #  @controllerCheck()
      @sendMessage()
      @scrollDownChat() if @scrollbar? 
  sendMessage: -> 
    @submit.keydown event, ->
      if event.keyCode == 13
        $('[data-send="message"]').click()
        $('[data-textarea="message"]').val(" ")        
        return false   
  scrollDownChat: -> 
    height = @scrollbar[0].scrollHeight
    @scrollbar.scrollTop(height)
	# controllerCheck: ->
		# window.location.pathname == "/purchases/new" 
