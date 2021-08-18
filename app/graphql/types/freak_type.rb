# frozen_string_literal: true

module Types
  class FreakType < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :name, String, null: false, deprecation_reason: 'Replaced by firstName and lastName'
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :description, String, null: false
    field :email, String, null: false
    field :photo, PhotoType, null: true
    field :skills, [SkillType], null: false
    field :projects, [ProjectType], null: false
    field :role, RoleType, null: false
    field :level, LevelType, null: false
    field :norm, NormType, null: false
    field :specialities, [SpecialityType], null: false
    field :technologies, [TechnologyType], null: false
  end
end
