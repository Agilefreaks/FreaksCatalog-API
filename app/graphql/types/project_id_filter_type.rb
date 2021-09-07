# frozen_string_literal: true

module Types
  class ProjectIdFilterType < Types::BaseInputObject
    argument :all_of, [GraphQL::Types::ID], required: false
    argument :any_of, [GraphQL::Types::ID], required: false

    validates required: { one_of: %i[all_of any_of], message: 'May use either allOf or anyOf, but not both.' }
  end
end
