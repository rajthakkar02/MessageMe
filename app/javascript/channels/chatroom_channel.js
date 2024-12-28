import consumer from "channels/consumer"
import scrollBottom from "application"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#message-container").append(data.message)
    scrollBottom()
    // Called when there's incoming data on the websocket for this channel
  }
});
