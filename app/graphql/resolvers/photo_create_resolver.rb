# frozen_string_literal: true

module Resolvers
  class PhotoCreateResolver < Resolvers::Base
    argument :imageable_id, GraphQL::Types::ID, required: true
    argument :imageable_type, String, 'Can have value Freak or Project, depending where the photo is assigned',
             required: true
    argument :uri, Types::Url, required: true

    type [Types::PhotoType], null: false

    # :reek:UtilityFunction
    def resolve(params)
      Photo.create(params)
    end
  end
end
