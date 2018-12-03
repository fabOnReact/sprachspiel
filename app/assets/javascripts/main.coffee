#$(document).ajaxError (event, request) -> 
#  new Alert(event, request)

# class Message
#   constructor: (@event, @request) ->
#     @msg = @request.getResponseHeader('X-Message').toString()
#     @renderAlerts() if @msg
#   renderAlerts: ->
#     alert(@msg)

