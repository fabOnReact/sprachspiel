class Message
  constructor: (@errors, css, @alert) ->
    @css = "in alert-" + css
    @div = $('ul#errors')
    if @alert 
      @renderAlert()
    else
      @renderErrors()
  renderAlert: -> 
    alert(@errors.toString())
  renderErrors: ->
    for message of @errors
      @authenticationError(message) if @errors[message] == "User must exist"
      @renderMessage(message)
    @div.removeClass('out hidden').addClass(@css)
  authenticationError:(message) -> 
    @errors[message] = "You need to log in to perform this action"
  renderMessage:(message) ->
    @div.append '<li>' + @errors[message] + '</li>'

window.Message = Message