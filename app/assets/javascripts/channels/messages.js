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
      return "<p>" + data.message + "</p>";
    } else {
      return "<br><p> <strong>" + data.user + ": </strong>" + data.message + "</p>";
    };
  }
});