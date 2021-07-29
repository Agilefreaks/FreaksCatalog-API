# frozen_string_literal: true

module Models
  class Photo < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :uri, Types::Url, null: false
  end
end