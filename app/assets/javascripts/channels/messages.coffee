App.cable.subscriptions.create { channel: "MessagesChannel" },
  received: (data) ->
    chatroom = new Chatroom(data)
    chatroom.scrollDownChat()
