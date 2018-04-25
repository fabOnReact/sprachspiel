# $(document).on "ajax:error", "form", (evt, xhr, status, error) ->
#    errors = xhr.responseJSON.error
#    for message of errors
#       $('#errors ul').append '<li>' + errors[message] + '</li>'

# $(document).ajaxError (evt, xhr, status, error) -> 
#   new Message(xhr)

# class Message
#   constructor: (xhr, status, error) ->
#     if xhr
#       console.log xhr
#       console.log xhr.responseJSON
#       @errors = xhr.responseJSON.error 
#       @div = $('ul#errors')
#       @renderErrors()
#   renderErrors: ->
#     for message of @errors
#       @errors[message] = "You need to log in to perform this action" if @errors[message] == "User must exist"
#       @renderMessage()
#     @div.removeClass('out').addClass('in')
#   renderMessage: ->
#     @div.append '<li>' + @errors[message] + '</li>'