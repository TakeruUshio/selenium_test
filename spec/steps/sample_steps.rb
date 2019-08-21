# -*- coding: utf-8 -*-

step "ブラウザを起動する" do
  case @browser
  when :firefox
    options = Selenium::WebDriver::Firefox::Options.new
  when :chrome
    options = Selenium::WebDriver::Chrome::Options.new
    # https://docs.travis-ci.com/user/chrome#sandboxing
    options.add_argument '--no-sandbox' if travis?
  else
    raise "Browser is not selected"
  end
  options.add_argument '--headless' if use_headless?
  @driver = Selenium::WebDriver.for @browser, options: options
  @driver.manage.timeouts.implicit_wait = 30
end

step "起動したブラウザが :browser であること" do |browser|
  expect(@driver.browser).to eq browser.to_sym
end

step "Seleniumのブラウザを閉じる" do
  @driver.close
end

step ":url にアクセスする" do |url|
  @driver.navigate.to url
end

step "前回のこのシナリオの結果が :result である" do |result|
  expect(@last_run_status).to eq result
end

# 以下expect系のstep
step ":button ボタンが表示されていること" do |button|
  button_list = @driver.all(:tag_name, "button")
  expect(button_list.map(&:text)).to include button
end

# ScreenShotを撮る
step "現在のページのスクリーンショットを撮る" do
  FileUtils.mkdir_p "tmp/images"
  @driver.save_screenshot("tmp/images/screenshot-%s.png" % [ Time.now.strftime("%Y%m%d-%H%M%S") ])
end

step ":num 秒待機する" do |num|
  sleep num.to_f
end

