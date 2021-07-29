# frozen_string_literal: true

module Models
  class Skill < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
  end
end
