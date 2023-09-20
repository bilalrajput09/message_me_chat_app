// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'channels';

const message_container = document.querySelector('#messages');

const scroll_bottom = () => {
  console.log(message_container.length);
  if (message_container.length > 0) {
    message_container.scrollTop(message_container[0].scrollHeight);
  }
};

document.addEventListener('load', () => {
  scroll_bottom();
});
