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
  return $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});