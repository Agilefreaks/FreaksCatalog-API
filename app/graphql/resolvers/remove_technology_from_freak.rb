# frozen_string_literal: true

module Resolvers
  class RemoveTechnologyFromFreak < Resolvers::Base
    argument :freak_id, GraphQL::Types::ID, required: true
    argument :name, String, required: true
    # argument :technology_id, GraphQL::Types::ID, required: true

    type Types::FreakTechnology, null: true

    def resolve(freak_id:, name:)
      technology_id = Technology.find(name).id
      freak_technology = FreakTechnology.find(freak_id)

      return unless technology_id == freak_technology.technology_id

      freak_technology.delete
      freak_technology
    end
  end
end
