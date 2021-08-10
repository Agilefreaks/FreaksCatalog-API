# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :freak_create, FreakType, null: false, resolver: Resolvers::FreakCreateResolver
    field :photo_create, Models::Photo, null: false, resolver: Resolvers::PhotoCreateResolver
  end
end
