# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :freak_create, FreakType, null: false, resolver: Resolvers::FreakCreateResolver
    field :photo_create, PhotoType, null: false, resolver: Resolvers::PhotoCreateResolver
    field :freakUpdate,FreakType,null: false, resolver: Resolvers::FreakUpdateResolver
  end
end
