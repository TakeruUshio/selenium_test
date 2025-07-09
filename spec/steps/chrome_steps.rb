# -*- coding: utf-8 -*-

steps_for :chrome_browser do
  step "ブラウザを起動する" do
    options = Selenium::WebDriver::Chrome::Options.new
    # https://docs.travis-ci.com/user/chrome#sandboxing
    options.add_argument '--no-sandbox' if travis?
    options.add_argument '--headless' if use_headless?
    @driver = Selenium::WebDriver.for :chrome, options: options
    @driver.manage.timeouts.implicit_wait = 30
  end
end

