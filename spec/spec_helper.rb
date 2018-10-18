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
  if !rspec_queue? && use_turnip_formatter?
    config.add_formatter ::RSpecTurnipFormatter, 'tmp/turnip_formatter/report.html'
  end
end

