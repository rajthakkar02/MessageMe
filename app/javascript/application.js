// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as jquery from "jquery"
import "semantic-ui"
import "channels"

function scrollBottom() {
    if ($('#messages').length > 0) {
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
}

function clearMessage() {
    $("#message_body").on("keydown", function (e) {
        if (e.key == "Enter") {
            $('#send').click();
            e.target.value = "";
        }
    })
}


$(document).on("turbo:load", function () {
    $('.ui.dropdown').dropdown();
    $('.message .close').on('click', function () {
        $(this).closest('.message').transition('fade');
    });
    clearMessage();
    scrollBottom();
})

export default scrollBottom;
