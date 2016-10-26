# -*- coding: utf-8 -*-

step "Seleniumでブラウザを使用する" do
  @driver = Selenium::WebDriver.for firefox.to_sym
  @driver.manage.timeouts.implicit_wait = 30
end

step "Seleniumのブラウザを閉じる" do
  @driver.quit()
end

