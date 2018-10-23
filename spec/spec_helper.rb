Dir.glob("spec/**/*steps.rb") { |f| load f, true }

require 'turnip/rspec'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'turnip'
require 'turnip/capybara'
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

def rspec_queue?
  defined?(::TestQueue::Runner::RSpec)
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

  if !rspec_queue? && use_turnip_formatter?
    config.add_formatter ::RSpecTurnipFormatter, 'tmp/turnip_formatter/report.html'
  end

  config.before do |scenario|
    browser_tags = [:firefox, :chrome]
    if browser_tags.select{|k| scenario.metadata[k] }.count > 1
      raise "Multiple browser tags are not allowed"
    else
      @browser = browser_tags.find{|k| scenario.metadata[k]}
    end
  end

  config.after do |scenario|
    if @driver&.browser == :chrome
      begin
        console_log = @driver.manage.logs.get(:browser)
        console_log.each{|log| logger.info("Chrome Console Log [#{log.level}] : #{log.message}")} if console_log
      rescue => e
      end
    end
  end
end

