import consumer from "./consumer";

window.addEventListener('turbolinks:load', function (event) {
  let comments = document.getElementById('comments');

  if (comments) {
    consumer.subscriptions.create({channel: "BlogsChannel", blog_id: comments.getAttribute('data-blog-id')}, {
      connected() {
        let newComment = document.getElementById('new_comment');

        if (newComment) {
          newComment.addEventListener('submit', (e) => {
            let textarea = document.getElementById('comment_content');

            if (textarea.value.trim().length > 1) {
              this.send_comment({ comment: textarea.value, blog_id: comments.getAttribute('data-blog-id')});
              textarea.value = '';
            }

            e.preventDefault();
            return false
          });

          let submitButton = document.querySelector("input[type='submit']");

          submitButton.addEventListener('blur', (e) => {
            submitButton.disabled = false
          });
        }
      },

      received(data) {
        let newComment = document.createElement('div');
        newComment.innerHTML = data['comment'];

        document.getElementById('comments').append(newComment);
      },

      send_comment(data) {
        this.perform("send_comment", {comment: data['comment'], blog_id: data['blog_id']})
      }
    });
  }
});