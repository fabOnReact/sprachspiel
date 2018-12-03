App.cable.subscriptions.create { channel: "MessagesChannel" },
  received: (data) ->
    new Message(data)
  renderMessage: (data) ->
    """
    <p class="message #{data.alignment}">#{data.user}: #{data.message}</p>
    """
