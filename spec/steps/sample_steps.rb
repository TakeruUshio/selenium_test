# -*- coding: utf-8 -*-

step ":use_browser でブラウザを起動する" do |use_browser|
  case use_browser
  when "firefox"
    options = Selenium::WebDriver::Firefox::Options.new
  when "chrome"
    options = Selenium::WebDriver::Chrome::Options.new
    # https://docs.travis-ci.com/user/chrome#sandboxing
    options.add_argument '--no-sandbox' if travis?   
  end
  options.add_argument '--headless' if use_headless?
  @driver = Selenium::WebDriver.for use_browser.to_sym, options: options
  @driver.manage.timeouts.implicit_wait = 30
end

step "Seleniumのブラウザを閉じる" do
  @driver.close
end

step ":url にアクセスする" do |url|
  @driver.navigate.to url
end

# 以下expect系のstep
step ":button ボタンが表示されていること" do |button|
  button_list = @driver.all(:tag_name, "button")
  expect(button_list.any?{|b| b.text == button}).to be_truthy
end

