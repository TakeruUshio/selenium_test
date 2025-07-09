# -*- coding: utf-8 -*-

step "ブラウザを起動する" do
  case @browser
  when :firefox
    options = Selenium::WebDriver::Firefox::Options.new
    options.profile = Selenium::WebDriver::Firefox::Profile.new
    #Firefoxでアラートを出さずに指定したPATHにファイルをDLする設定
    options.profile['browser.download.folderList'] = 2
    options.profile['browser.download.useDownloadDir'] = true
    options.profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/plane,text/csv,application/x-ofx,text/comma-separated-values,application/octet-stream,application/vnd.ms-excel'
    options.profile['browser.helperApps.alwaysAsk.force'] = false
    options.profile['browser.download.manager.showWhenStarting'] = false
    # Firefox stability improvements
    options.add_argument '--disable-gpu'
    options.add_argument '--disable-dev-shm-usage'
    options.add_argument '--disable-extensions'
    options.add_argument '--no-sandbox'
  when :chrome
    options = Selenium::WebDriver::Chrome::Options.new
    # Chrome stability improvements
    options.add_argument '--disable-gpu'
    options.add_argument '--disable-dev-shm-usage'
    options.add_argument '--disable-extensions'
    options.add_argument '--no-sandbox'
  else
    raise "Browser is not selected"
  end
  options.add_argument '--headless' if use_headless?
  @driver = Selenium::WebDriver.for @browser, options: options
  @driver.manage.timeouts.implicit_wait = 30
  @driver.manage.timeouts.page_load = 60
  @driver.manage.timeouts.script_timeout = 30
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
step "ブラウザのcookieをrejectする" do
  # Cookie reject処理（実装は環境に応じて調整）
  # この例では何もしない（プレースホルダー）
end

step ":button リンクが表示されていること" do |button|
  # Wait for page to load completely
  @driver.manage.timeouts.implicit_wait = 10
  
  # Check if browser window is still available
  begin
    @driver.window_handles
  rescue Selenium::WebDriver::Error::NoSuchWindowError
    fail "Browser window was closed unexpectedly"
  end
  
  # Find links with retry
  button_list = nil
  3.times do |i|
    begin
      button_list = @driver.all(:tag_name, "a")
      break if button_list.any?
      sleep 1
    rescue Selenium::WebDriver::Error::NoSuchWindowError
      fail "Browser window was closed unexpectedly"
    rescue => e
      raise e if i == 2
      sleep 1
    end
  end
  
  button_texts = button_list.map(&:text).compact.reject(&:empty?)
  expect(button_texts).to include button
end

