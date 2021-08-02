# frozen_string_literal: true

module Types
  class Project < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :photo, Models::Photo, null: false
    field :technologies, [Models::Technology], null: false
  end
end
