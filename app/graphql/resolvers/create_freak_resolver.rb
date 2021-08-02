# frozen_string_literal: true

module Resolvers
  class CreateFreakResolver < Resolvers::Base
    argument :name, String, required: true
    argument :description, String, required: true
    type [Types::FreakType], null: false

    # :reek:UtilityFunction
    def resolve(params)
      Freak.create(params)
    end
  end
end
