document.addEventListener('turbolinks:load', function() {
  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room_id: $('#messages').data('room_id')
  }, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return $('#messages').append(data['message']);
    },
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });
  return $(document).on('click', '.submit-btn', function() {
    var textarea = $('[data-behavior~=room_speaker]'); 
    App.room.speak(textarea.val());
    textarea.val('');
  });
});