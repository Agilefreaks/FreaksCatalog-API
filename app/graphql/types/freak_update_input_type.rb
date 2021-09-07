# frozen_string_literal: true

module Types
  class FreakUpdateInputType < Types::BaseInputObject
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
  end
end
