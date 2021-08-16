# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :freak_create, FreakType, null: false, resolver: Resolvers::FreakCreateResolver
  end
end
