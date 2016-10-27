# -*- coding: utf-8 -*-

step "Seleniumでブラウザを使用する" do
  @driver = Selenium::WebDriver.for :firefox
  @driver.manage.timeouts.implicit_wait = 30
end

step "Seleniumのブラウザを閉じる" do
  @driver.quit()
end

step ":url にアクセスし :text を検索する" do |url, text|
  @driver.navigate.to url
  sleep 5
  i = @driver.find_element(:id, "sb_ifc0").find_element(:tag_name, "input")
  i.clear
  i.send_keys(text)

  @driver.find_element(:class, "jhp").click
  @driver.find_element(:class, "jsb").find_element(:tag_name, "input").click
  sleep 10
end

step ":text と表示されること" do |text|
  expect(@driver.find_element(:class, "med").text).to eq (text)
end

