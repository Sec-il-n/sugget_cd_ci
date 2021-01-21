App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

# 非同期で画面に入力した文字を表示(ブロードキャストされたmessageをクライアントサイドのrecieveの処理を変更し、viewにappendする。)
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append("<p>"+data["message"]+"</p>"); # 投稿を追加

  speak: (message) ->
    @perform 'speak', message: message#サーバーサイドのspeakアクションにmessageパラメータを渡す

# 入力後にエンターキーを押したときの動作を定義
jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 #keyCodeが13（エンターキー）の場合に、サーバー側に発言メッセージを送信する処理を呼び出す
    App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')] #room->coffe名　speakメソッドに引数を与えている。（）各属性については<input>タグ
    event.target.value = ''
    event.preventDefault()
