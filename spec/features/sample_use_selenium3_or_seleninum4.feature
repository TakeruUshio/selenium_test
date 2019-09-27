# encoding: utf-8
# language: ja

機能: サンプル
  @selenium3 @firefox
  シナリオ: use selenium3
    もし   ブラウザを起動する
    もし   'https://travis-ci.org' にアクセスする
    かつ   'Sign Up' ボタンが表示されていること
    かつ   Seleniumのブラウザを閉じる

  @selenium4 @firefox
  シナリオ: use selenium4
    もし   ブラウザを起動する
    もし   'https://travis-ci.org' にアクセスする
    かつ   'Sign Up' ボタンが表示されていること
    かつ   Seleniumのブラウザを閉じる

