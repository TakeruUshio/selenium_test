# encoding: utf-8
# language: ja

機能: サンプル
  @firefox
  シナリオ: use browser firefox
    もし   ブラウザを起動する
    ならば 起動したブラウザが firefox であること
    もし   'https://travis-ci.org' にアクセスする
    かつ   'Sign Up' ボタンが表示されていること
    かつ   Seleniumのブラウザを閉じる

  @chrome
  シナリオ: サンプル
    もし   ブラウザを起動する
    ならば 起動したブラウザが chrome であること
    もし   'https://travis-ci.org' にアクセスする
    かつ   'Sign Up' ボタンが表示されていること
    かつ   Seleniumのブラウザを閉じる

