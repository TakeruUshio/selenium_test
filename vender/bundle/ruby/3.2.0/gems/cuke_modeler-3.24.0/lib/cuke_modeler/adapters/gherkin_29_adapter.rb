require_relative 'gherkin_20_adapter'


module CukeModeler

  # @api private
  #
  # An adapter that can convert the output of version 29.x of the *cucumber-gherkin* gem into input that is consumable
  # by this gem. Internal helper class.
  class Gherkin29Adapter < Gherkin20Adapter; end

  private_constant :Gherkin29Adapter
end
