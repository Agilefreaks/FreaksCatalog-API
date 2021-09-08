# frozen_string_literal: true

module Types
  class FreakTechnology < Types::BaseObject
    field :id, GraphQL::Types::ID, null: true
    field :freak_id, GraphQL::Types::ID, null: true
    field :technology_id, GraphQL::Types::ID, null: true
  end
end
