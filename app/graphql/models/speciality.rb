# frozen_string_literal: true

module Types
  class Speciality < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
  end
end
