# README

payjpでtokenを渡す時にparamsに値が上手く入っていなかった
・原因
→ appendメソッドを使ってinput要素をhiddenにしてその中にval()メソッドで取得していたtokenを入れようとしたが
$('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token)のようにjQueryオブジェクトに変換していなくて値が入っていなかった