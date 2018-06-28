Dir.glob("spec/**/*steps.rb") { |f| load f, true }

require 'turnip/rspec'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'turnip'
require 'turnip/capybara'
require 'selenium-webdriver'
require 'turnip_formatter'

def use_turnip_formatter?
  ENV['DISABLE_TURNIP_FORMATTER'] !~ /\A(1|on|true|yes)\z/i
end

RSpec.configure do |config|
  if use_turnip_formatter?
    config.add_formatter ::RSpecTurnipFormatter, 'tmp/turnip_formatter/report.html'
  end
end

