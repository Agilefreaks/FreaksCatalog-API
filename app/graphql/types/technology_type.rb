# frozen_string_literal: true

module Types
  class TechnologyType < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
    field :description, String, null: false
  end
end
