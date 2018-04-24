# $(document).on "ajax:error", "form", (evt, xhr, status, error) ->
#    errors = xhr.responseJSON.error
#    for message of errors
#       $('#errors ul').append '<li>' + errors[message] + '</li>'

$(document).ajaxError (evt, xhr, status, error) -> 
  new Message(xhr)

class Message
  constructor: (xhr) ->
    @errors = xhr.responseJSON.error
    @renderErrors()
  renderErrors: ->
    for message of @errors
      $('ul#errors').append '<li>' + @errors[message] + '</li>'