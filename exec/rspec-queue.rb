#! /usr/bin/env ruby

require 'test_queue'
require 'test_queue/runner/rspec'
require 'turnip_formatter'

class MyAppTestRunner < TestQueue::Runner::RSpec
  def after_fork(num)
    if use_turnip_formatter?
      ::RSpec.configure do |config|
        if config.filter_manager.inclusions.rules[:last_run_status] == "failed"
          # with --only-failures option
          config.add_formatter ::RSpecTurnipFormatter, "tmp/turnip_formatter/report_retry-#{num}.html"
        else
          config.add_formatter ::RSpecTurnipFormatter, "tmp/turnip_formatter/report-#{num}.html"
        end
      end
    end
  end

  # override run_worker method to call `persist_example_statuses`
  # ref:
  # - https://github.com/tmm1/test-queue/blob/v0.2.13/lib/test_queue/runner/rspec.rb#L21-L23
  # - https://github.com/rspec/rspec-core/blob/v3.8.0/lib/rspec/core/runner.rb#L85-L90
  def run_worker(iterator)
    @rspec.run_each(iterator).tap{
      # `persist_example_statuses` is private method
      # ref: https://github.com/rspec/rspec-core/blob/v3.8.0/lib/rspec/core/runner.rb#L186-L196
      @rspec.send(:persist_example_statuses)
    }.to_i
  end
end

MyAppTestRunner.new.execute

