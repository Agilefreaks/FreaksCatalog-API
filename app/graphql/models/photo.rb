# frozen_string_literal: true

module Types
  class Photo < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :uri, Types::Url, null: false
  end
end
