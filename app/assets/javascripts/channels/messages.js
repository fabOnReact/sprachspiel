App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden');
    $('#messages').append(this.renderMessage(data));
    height = $('.scroll-bar')[0].scrollHeight;
    $('.scroll-bar').scrollTop(height);
	  /*return $('#messages').append(this.renderMessage(data));*/
  },
  renderMessage: function(data) {
    if (data.lastuser == data.user) {
      return data.message;
    } else {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    };
  }
});