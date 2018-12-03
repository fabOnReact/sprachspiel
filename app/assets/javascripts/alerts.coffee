class @Alert
  constructor: (@errors, css, @alert) ->
    @clearAlerts()
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
  clearAlerts: ->
    $('ul.alert').children().remove()
  authenticationError:(message) -> 
    @errors[message] = "You need to log in to perform this action"
  renderMessage:(message) ->
    @div.append '<li>' + @errors[message] + '</li>'
