App.messages = App.cable.subscriptions.create('MessagesChannel', {      
  received: function(data) {
    messages = $('#chatroom_id');
    chat_room_id = messages.data('chat-room-id');
    if (data.chatroom_id == chat_room_id) {
      $("#messages").removeClass('hidden');
      $('#messages').append(this.renderMessage(data));
      height = $('.scroll-bar')[0].scrollHeight;
      $('.scroll-bar').scrollTop(height);
      };
  },
  renderMessage: function(data) {
    if (data.lastuser == data.user) {
      return "<p>" + data.message + "</p>";
      } else {
      return "<br><p> <strong>" + data.user + ": </strong>" + data.message + "</p>";
      };
  }
});