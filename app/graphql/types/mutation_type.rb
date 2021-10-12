# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :freak_create, resolver: Resolvers::FreakCreateResolver
    field :photo_create, resolver: Resolvers::PhotoCreateResolver
    field :freak_update, resolver: Resolvers::FreakUpdateResolver
    field :freak_deactivate, resolver: Resolvers::FreakDeactivateResolver
  end
end
