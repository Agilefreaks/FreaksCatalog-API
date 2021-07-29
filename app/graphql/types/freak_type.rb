# frozen_string_literal: true

module Types
  class FreakType < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
    field :photo, String, null: false
    field :description, String, null: false
  end
end
