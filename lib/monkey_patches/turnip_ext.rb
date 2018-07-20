## Turnip::RSpec.run_feature (https://github.com/jnicklas/turnip/blob/v3.1.0/lib/turnip/rspec.rb#L79-L102)
## をモンキーパッチして rspec の example の description を activesupport の String#truncate_words で短くします

require 'turnip/rspec'
require 'active_support/core_ext/string/filters'

expected_turnip_version = '3.1.0'
if Turnip::VERSION != expected_turnip_version
  raise "#{__FILE__} は turnip #{expected_turnip_version} 向けに書かれています"
end

module TurnipMonkeyPatch
  module ShortenExampleDescription
    private

    def run_feature(context, feature, filename)
      background_steps = feature.backgrounds.map(&:steps).flatten

      context.before do
        background_steps.each do |step|
          run_step(filename, step)
        end
      end

      feature.scenarios.each do |scenario|
        step_names = (background_steps + scenario.steps).map(&:to_s)
        description = step_names.join(' -> ')

        description = description.truncate_words 5, omission: " ...(snip)..."

        context.describe scenario.name, scenario.metadata_hash do
          instance_eval <<-EOS, filename, scenario.line
              it description do
                scenario.steps.each do |step|
                  run_step(filename, step)
                end
              end
          EOS
        end
      end
    end
  end
end

module Turnip
  module RSpec
    class << self
      prepend TurnipMonkeyPatch::ShortenExampleDescription
    end
  end
end

