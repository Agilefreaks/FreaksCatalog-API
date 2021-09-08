# frozen_string_literal: true

module Resolvers
  class FreakUpdateResolver < Resolvers::Base
    argument :id, GraphQL::Types::ID, required: true,
             validates: { in_db: { type: Freak } }
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :description, String, required: false
    argument :email, String, required: false
    argument :norm_id, GraphQL::Types::ID, required: false,
             validates: { in_db: { type: Norm } }
    argument :role_id, GraphQL::Types::ID, required: false,
             validates: { in_db: { type: Role } }
    argument :level_id, GraphQL::Types::ID, required: false,
             validates: { in_db: { type: Level } }

    type Types::FreakType, null: false

    def resolve(input:)
      freak = Freak.find(input[:id])

      return unless freak

      freak.update(input.to_h)
      freak
    end
  end
end
