# encoding: utf-8
# language: ja

@firefox
機能: サンプル
 シナリオ: サンプル
   もし   ブラウザを起動する
   かつ   'https://travis-ci.org' にアクセスする
   ならば 'Sign Up' ボタンが表示されていること
   もし   '0.5' 秒待機する
   かつ   現在のページのスクリーンショットを撮る
   かつ   Seleniumのブラウザを閉じる

