# encoding: utf-8
# language: ja

@firefox
機能: サンプル
 シナリオ: サンプル
   もし   ブラウザを起動する
   かつ   'https://travis-ci.com' にアクセスする
   ならば 'Start Now' リンクが表示されていること
   かつ   Seleniumのブラウザを閉じる

