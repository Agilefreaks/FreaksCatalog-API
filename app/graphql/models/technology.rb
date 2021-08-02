# frozen_string_literal: true

module Types
  class Technology < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
    field :description, String, null: false
  end
end
