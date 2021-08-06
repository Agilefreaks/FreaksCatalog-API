# frozen_string_literal: true

module Resolvers
  class FreakCreateResolver < Resolvers::Base
    argument :name, String, required: true
    argument :description, String, required: true
    argument :email, String, required: true

    type [Types::FreakType], null: false

    # :reek:UtilityFunction
    def resolve(params)
      Freak.create(params)
    end
  end
end
