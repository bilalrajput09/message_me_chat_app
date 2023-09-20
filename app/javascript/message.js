$(document).on('turbolinks:load', function () {
  var chatMessages = $('#message_container');
  chatMessages.scrollTop(chatMessages[0].scrollHeight);

  $('.form').on('ajax:success', function (event) {
    $(this).find('input[type="text"]').val('');
    chatMessages.append(
      '<div class="message">' + event.detail[0].message + '</div>',
    );
    chatMessages.scrollTop(chatMessages[0].scrollHeight);
  });
});
