App.cable.subscriptions.create { channel: "MessagesChannel" },
  received: (data) ->
    new Chatroom(data).scrollDownChat()
