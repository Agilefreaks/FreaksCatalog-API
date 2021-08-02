# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_freak, FreakType, null: false, resolver: Resolvers::CreateFreakResolver
  end
end
