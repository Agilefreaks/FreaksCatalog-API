# frozen_string_literal: true

module Resolvers
  class PhotoCreateResolver < Resolvers::Base
    argument :uri, Types::Url, required: true

    type [Types::Models::Photo], null: false

    # :reek:UtilityFunction
    def resolve(params)
      Photo.create(params)
    end
  end
end
