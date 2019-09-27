Dir.glob("spec/**/*steps.rb") { |f| load f, true }

require 'turnip/rspec'
require 'turnip'
require 'selenium-webdriver'
require 'turnip_formatter'
require 'pry'
require 'pathname'
require 'logger'

$LOAD_PATH.unshift "#{__dir__}/../lib"
require 'monkey_patches/turnip_ext'

def logger
  @logger ||= Logger.new($stdout, level: :info)
end

def use_turnip_formatter?
  ENV['DISABLE_TURNIP_FORMATTER'] !~ /\A(1|on|true|yes)\z/i
end

def use_headless?
  ENV['USE_HEADLESS'] =~ /\A(1|on|true|yes)\z/i
end

def travis?
  ENV['TRAVIS'] == "true"
end

RSpec.configure do |config|
  # https://relishapp.com/rspec/rspec-core/docs/command-line/only-failures
  config.example_status_persistence_file_path = 'tmp/example_status.txt'

  config.before do |scenario|
    selenium_ver = Selenium::WebDriver::VERSION

    s_sym =  case selenium_ver.split('.')[0]
             when "3" then :selenium3
             when "4" then :selenium4
             else
               raise "Selenium #{selenium_ver} version is not supported"
             end

    metadata = scenario.metadata
    if metadata[:selenium3] || metadata[:selenium4]
      skip unless metadata[s_sym]
    end
  end

  if use_turnip_formatter?
    if config.filter_manager.inclusions.rules[:last_run_status] == "failed"
      # with --only-failures option
      config.add_formatter ::RSpecTurnipFormatter, 'tmp/turnip_formatter/report_retry.html'
    else
      config.add_formatter ::RSpecTurnipFormatter, 'tmp/turnip_formatter/report.html'
    end
  end

  config.before do |scenario|
    browser_tags = [:firefox, :chrome]
    if browser_tags.select{|k| scenario.metadata[k] }.count > 1
      raise "Multiple browser tags are not allowed"
    else
      @browser = browser_tags.find{|k| scenario.metadata[k]}
    end
  end

  config.before do |scenario|
    @last_run_status = scenario.metadata[:last_run_status]
  end

  config.after do |scenario|
    if @driver&.browser == :chrome
      begin
        console_log = @driver.manage.logs.get(:browser)
        console_log.each{|log| logger.info("Chrome Console Log [#{Time.at(log.timestamp / 1000)}] [#{log.level}] : #{log.message}")} if console_log
      rescue => e
      end
    end
  end
end

