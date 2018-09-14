## Turnip::Execute#step (https://github.com/jnicklas/turnip/blob/v3.1.0/lib/turnip/execute.rb)
## をラップして step 呼び出しの前後にログ出力します

require 'logger'
require 'turnip/execute'
require 'turnip/version'

expected_turnip_version = '3.1.0'
if Turnip::VERSION != expected_turnip_version
  raise "#{__FILE__} は turnip #{expected_turnip_version} 向けに書かれています"
end

module MonkeyPatches
  module TurnipExt
    module StepCallWithLogger
      class StepCounter
        def initialize
          @current_depth = 0
          @count = Hash.new(0)
        end

        def count(&block)
          @current_depth += 1
          @count[@current_depth] += 1
          step_count = @count.sort_by{|k,v| k}.select{|k,v| k <= @current_depth }.map{|k,v| v }.join("-")
          begin
            block.call step_count
          ensure
            @count.delete(@current_depth+1) if @count.has_key?(@current_depth+1)
            @current_depth -= 1
          end
        end
      end

      def step_with_hook(step_or_description, *extra_args)
        @logger ||= defined?(logger) ? logger : Logger.new($stdout).tap{|o| o.level = :debug }
        @counter ||= StepCounter.new

        step_name = step_or_description.respond_to?(:description) ? step_or_description.description : step_or_description
        t1 = Time.now

        @counter.count do |step_count|
          @logger.debug "[#{step_count}] Starting step #{step_name}"
          begin
            r = step_without_hook(step_or_description, *extra_args)
            t2 = Time.now
            @logger.info "[#{step_count}] Finished step #{step_name} (#{"%.3f" % [t2-t1]} sec)"
            r
          rescue StandardError, ::RSpec::Expectations::ExpectationNotMetError => e
            t2 = Time.now
            @logger.error "[#{step_count}] Failed step #{step_name} (#{"%.3f" % [t2-t1]} sec)"
            raise e
          end
        end
      end

      def self.included(mod)
        mod.alias_method :step_without_hook, :step
        mod.alias_method :step, :step_with_hook
      end
    end
  end
end

module Turnip
  module Execute
    include MonkeyPatches::TurnipExt::StepCallWithLogger
  end
end

