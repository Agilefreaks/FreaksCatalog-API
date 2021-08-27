# frozen_string_literal: true

module Types
  class TechnologyIdFilterType < Types::BaseInputObject
    argument :all_of, [GraphQL::Types::ID], required: false
    argument :any_of, [GraphQL::Types::ID], required: false
  end
end
