# frozen_string_literal: true

module Validation
  class InDbValidator < GraphQL::Schema::Validator
    def initialize(type:, **default_options)
      @type = type
      super(**default_options)
    end

    def validate(_object, _context, value)
      "#{@type} with id = #{value} does not exist." if @type.find_by(id: value).nil?
    end
  end
end
