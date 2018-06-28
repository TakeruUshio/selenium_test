#! /usr/bin/env ruby

require 'test_queue'
require 'test_queue/runner/rspec'
require 'turnip_formatter'

class MyAppTestRunner < TestQueue::Runner::RSpec
  def after_fork(num)
    if use_turnip_formatter?
      ::RSpec.configure do |config|
        config.add_formatter ::RSpecTurnipFormatter, "tmp/turnip_formatter/report-#{num}.html"
      end
    end
  end
end

MyAppTestRunner.new.execute

