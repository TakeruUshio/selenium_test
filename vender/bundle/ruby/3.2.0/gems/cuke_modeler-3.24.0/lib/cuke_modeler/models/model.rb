module CukeModeler

  # A class modeling an element of a Cucumber suite. All model classes should descend from this class.
  class Model

    include Nested
    include Containing


    # Creates a new Model object and, if *source_text* is provided,
    # populates the object. For the base model class, there is nothing
    # to populate.
    #
    # @example
    #   Model.new
    #   Model.new('some source text')
    #
    # @param source_text [String] The string that will be used to populate the model. Defaults to nil.
    # @raise [ArgumentError] If *source_text* is not a String
    # @return [Model] A new Model instance
    def initialize(source_text = nil)
      error_message = "Can only create models from Strings but was given a #{source_text.class}."
      raise(ArgumentError, error_message) if source_text && !source_text.is_a?(String)

      return unless source_text

      source_data = process_source(source_text)
      populate_model(source_data)
    end

    # It's a lazy implementation but it's mandatory for the class to define this method
    # rubocop:disable Lint/UselessMethodDefinition

    # Returns a string representation of this model. Because the base model class
    # doesn't represent anything specific, its string output is undefined.
    #
    # @example
    #   model.to_s
    #
    # @return [String] A string representation of this model
    def to_s
      super
    end

    # rubocop:enable Lint/UselessMethodDefinition

    # Returns the model objects that are children of this model.
    #
    # @example
    #   model.children
    #
    # @return [Array<Model>] A collection of child models
    def children
      []
    end

    # See `Object#inspect`. Returns some basic information about the
    # object, including its class and object ID. If *verbose* is true,
    # provides default Ruby inspection behavior instead.
    #
    # @example
    #   model.inspect
    #   model.inspect(verbose: true)
    #
    # @param verbose [Boolean] Whether or not to return the full details of
    #   the object. Defaults to false.
    # @return [String] A string representation of this model
    def inspect(verbose: false)
      return super() if verbose

      "#<#{self.class.name}:#{object_id}>"
    end


    private


    def process_source(source_text)
      # No-op. Overridden by child classes.
    end

    def populate_model(model_data)
      # No-op. Overridden by child classes.
    end

  end
end
