# -*- coding: utf-8 -*-

require 'turnip/rspec'

module Turnip
  module RSpec
    class << self
      alias_method :original_run, :run

      def run(feature_file)
        original_run(feature_file)

        feature = Turnip::Builder.build(feature_file)
        return nil if feature.nil?

        example_group = ::RSpec.world.example_groups.last

        update_metadata(feature, example_group)
      end

      #
      # @param  [Turnip::Node::Feature]      feature
      # @param  [RSpec::Core::ExampleGroup]  example_group
      #
      def update_metadata(feature, example_group)
        examples = example_group.children

        feature.scenarios.zip(examples).each do |scenario, parent_example|
          example = parent_example.examples.first
          example.metadata[:turnip_formatter] = {
            feature: feature,
            scenario: scenario,
          }
        end
      end
    end
  end
end
