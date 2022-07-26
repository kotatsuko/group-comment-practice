/* global commentContainer*/
/* global scrollToBottom*/



import consumer from "./consumer"

// turbolinks の読み込みが終わった後にidを取得しないと，エラーが出ます。
document.addEventListener('turbolinks:load', () => {

  // js.erb 内で使用できるように変数を定義しておく
  window.commentContainer = document.getElementById('comment-container')

  // 以下のプログラムが他のページで動作しないようにしておく
  if (commentContainer === null) {
      return
  }

  const documentElement = document.documentElement
  // js.erb 内でも使用できるように変数を決定
  window.messageContent = document.getElementById('message_content')
  // 一番下まで移動する関数。js.erb 内でも使用できるように変数を決定
  window.scrollToBottom = () => {
      window.scroll(0, documentElement.scrollHeight)
  }

  // 最初にページ一番下へ移動させる
  scrollToBottom()

  consumer.subscriptions.create("GroupChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      // サーバー側から受け取ったHTMLを一番最後に加える
      commentContainer.insertAdjacentHTML('beforeend', data['comment']);
      scrollToBottom();
    }

  });
});


