# encoding: utf-8
# language: ja

機能: サンプル
  @firefox
  シナリオ: use browser firefox
    もし   ブラウザを起動する
    ならば 起動したブラウザが firefox であること
    もし   'https://travis-ci.com' にアクセスする
    かつ   ブラウザのcookieをrejectする
    ならば 'Start Now' リンクが表示されていること
    かつ   Seleniumのブラウザを閉じる

  @chrome
  シナリオ: use browser chrome
    もし   ブラウザを起動する
    ならば 起動したブラウザが chrome であること
    もし   'https://travis-ci.com' にアクセスする
    ならば 'Start Now' リンクが表示されていること
    かつ   Seleniumのブラウザを閉じる

