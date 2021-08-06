# frozen_string_literal: true

module Types
  class FreakType < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false
    field :photo, Models::Photo, null: false
    field :description, String, null: false
    field :email, String, null: false
    field :skills, [Models::Skill], null: false
    field :projects, [Models::Project], null: false
    field :role, Models::Role, null: false
    field :level, Models::Level, null: false
    field :norm, Models::Norm, null: false
    field :speciality, [Models::Speciality], null: false
  end
end
