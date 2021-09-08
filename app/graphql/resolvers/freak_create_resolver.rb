# frozen_string_literal: true

module Resolvers
  class FreakCreateResolver < Resolvers::Base
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :email, String, required: true
    argument :norm_id, GraphQL::Types::ID, required: true,
                                           validates: { in_db: { type: Norm } }
    argument :role_id, GraphQL::Types::ID, required: true,
                                           validates: { in_db: { type: Role } }
    argument :level_id, GraphQL::Types::ID, required: true,
                                            validates: { in_db: { type: Level } }

    type Types::FreakType, null: false

    def resolve(params)
      norm = Norm.find(params[:norm_id])
      role = Role.find(params[:role_id])
      level = Level.find(params[:level_id])

      Freak.create(params.merge(norm: norm, role: role, level: level))
    end
  end
end
