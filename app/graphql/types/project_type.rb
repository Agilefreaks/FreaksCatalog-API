# frozen_string_literal: true

module Types
  class ProjectType < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :logo_url, PhotoType, null: false
    field :freaks, [FreakType], null: false
    field :technologies, [TechnologyType], null: false
  end
end
