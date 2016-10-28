# -*- coding: utf-8 -*-

step "Seleniumでブラウザを使用する" do
  @driver = Selenium::WebDriver.for :firefox
  @driver.manage.timeouts.implicit_wait = 30
end

step "Seleniumのブラウザを閉じる" do
  @driver.quit()
end

step ":url にアクセスする" do |url|
  @driver.navigate.to url
end

step ":button ボタンが表示されていること" do |button|
	button_list = @driver.all(:tag_name, "button")
	expect(button_list.any?{|b| b.text == button}).to be_truthy
end

