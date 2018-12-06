class @Message
  constructor: (@data)->
    $('#messages').append(@message)
  message: =>
    """
    <div class='sc-message'>
      <div class='sc-message--content #{@data.alignment}'>
       <div class='sc-message--text speech-bubble'>#{@data.message} <span>from #{@data.user}</span></div>
      </div>
    </div>
    """


