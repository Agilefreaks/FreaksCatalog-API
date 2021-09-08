# frozen_string_literal: true

module Resolvers
  class FreakUpdateResolver < Resolvers::Base
    argument :id, GraphQL::Types::ID, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :description, String, required: false
    argument :email, String, required: false
    argument :norm_id, GraphQL::Types::ID, required: false
    argument :role_id, GraphQL::Types::ID, required: false
    argument :level_id, GraphQL::Types::ID, required: false

    type Types::FreakType, null: false

    # TODO: Test if Freak with this id exist. Test if norm_id,level_id and role_id exist
    def resolve(id:, **attrs)
      freak = Freak.find(id)

      return unless freak

      freak.update(attrs)
      freak
    end
  end
end
