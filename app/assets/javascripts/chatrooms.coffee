$(document).on 'turbolinks:load', ->
  $('[data-id="chatroom-input"]').keydown (event) -> 
    if event.key == "Enter" 
      $('[data-send="message"]').click()
      $('[data-textarea="message"]').val(" ")        
    
class @Message
  constructor: (@data)-> 
    $('#messages').append(@message)
    @submit = $('[data-id="chatroom-input"]')
    @scrollbar = $('[data-id="scroll-bar"]')
    unless @submit.length == 0 #  @controllerCheck()
      @sendMessage()
      @scrollDownChat() if @scrollbar? 
  sendMessage: -> 
    @submit.keydown (event) ->
      if event.key == "Enter" 
        $('[data-send="message"]').click()
        $('[data-textarea="message"]').val(" ")        
        return false   
  scrollDownChat: -> 
    height = @scrollbar[0].scrollHeight
    @scrollbar.scrollTop(height)
  message: => 
    """
    <div class='sc-message'>
      <div class='sc-message--content #{@data.alignment}'>
       <div class='sc-message--text speech-bubble'>#{@data.message} <span>from #{@data.user}</span></div>
      </div>
    </div>
    """


