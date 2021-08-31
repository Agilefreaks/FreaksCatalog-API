# frozen_string_literal: true

module Resolvers
  class FreakUpdateResolver < Resolvers::Base
    argument :id, GraphQL::Types::ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :email, String, required: true
    argument :norm_id, GraphQL::Types::ID, required: true
    argument :role_id, GraphQL::Types::ID, required: true
    argument :level_id, GraphQL::Types::ID, required: true

    type [Types::FreakType], null: false

    # TODO: Test if norm_id exist
    # TODO: Test if role_id exist
    #TODO: Test if level_id exist
    def resolve(id:, **attrs)
      norm = Norm.find(attrs[:norm_id])
      role = Role.find(attrs[:role_id])
      level = Level.find(attrs[:level_id])

      freak = Freak.find(id)

      if freak
        freak.update(attrs.merge(norm: norm, role: role, level: level))
        freak
      else

      end
    end
  end
end
