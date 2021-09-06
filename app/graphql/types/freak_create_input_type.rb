# frozen_string_literal: true

module Types
  class FreakCreateInputType < Types::BaseInputObject
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :email, String, required: true
    argument :norm_id, GraphQL::Types::ID, required: true,
                                           validates: { in_db: { type: Norm } }
    argument :role_id, GraphQL::Types::ID, required: true
    argument :level_id, GraphQL::Types::ID, required: true
  end
end
