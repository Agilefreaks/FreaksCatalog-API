# frozen_string_literal: true

module Resolvers
  class FreakCreateResolver < Resolvers::Base
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :description, String, required: true
    argument :email, String, required: true
    argument :norm_id, GraphQL::Types::ID, required: true
    argument :role_id, GraphQL::Types::ID, required: true
    type [Types::FreakType], null: false

    # TODO: Test if norm_id exist
    # TODO: Test if role_id exist
    def resolve(params)
      norm = Norm.find(params[:norm_id])
      Freak.create(params.merge(norm: norm))

      role= Role.find_by(name:params[:role])
      Freak.create(params.merge(role:role))
    end
  end
end
