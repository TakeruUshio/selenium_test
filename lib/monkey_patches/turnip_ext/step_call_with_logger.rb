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
      class StepGraph
        attr_reader :parent, :children

        def initialize(name, parent: nil)
          @name = name
          @parent = parent
          @children = []
          @parent.children.push self if @parent
        end

        def ancestors
          if @parent
            [@parent, *@parent.ancestors]
          else
            []
          end
        end

        def index
          if @parent
            @parent.children.index(self)
          else
            nil
          end
        end
      end

      def step_with_hook(step_or_description, *extra_args)
        @logger ||= defined?(logger) ? logger : Logger.new($stdout, level: :debug)
        @current ||= StepGraph.new('root')

        step_name = step_or_description.respond_to?(:description) ? step_or_description.description : step_or_description

        parent, @current = @current, StepGraph.new(step_name, parent: @current)
        step_count = [@current, *@current.ancestors].map(&:index).compact.map{|i| i+1 }.reverse.join("-")
        log_level_map = {
          started:  @current.parent.parent ? :debug : :debug,
          failed:   @current.parent.parent ? :warn  : :error,
          finished: @current.parent.parent ? :debug : :info,
        }

        begin
          @logger.send(log_level_map[:started], "[#{step_count}] Starting step #{step_name}")
          t1 = Time.now
          r = step_without_hook(step_or_description, *extra_args)
          t2 = Time.now
          @logger.send(log_level_map[:finished], "[#{step_count}] Finished step #{step_name} (#{"%.3f" % [t2-t1]} sec)")
          r
        rescue StandardError, ::RSpec::Expectations::ExpectationNotMetError => e
          t2 = Time.now
          @logger.send(log_level_map[:failed], "[#{step_count}] Failed step #{step_name} (#{"%.3f" % [t2-t1]} sec)")
          raise e
        ensure
          @current = parent
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

