# frozen_string_literal: true

module Resolvers
  class RemoveTechnologyFromFreak < Resolvers::Base
    argument :id, GraphQL::Types::ID, required: true
    argument :name,String,required: true
    argument :technology_id,GraphQL::Types::ID,required:true

    type Types::FreakTechnology, null: false

    def resolve(id:,name:,technology_id:)
      freak_technology=FreakTechnology.find(id)
      technology_id=Technology.find(name).id
      freak_technology_id= FreakTechnology.find(technology_id)

      if technology_id  == freak_technology_id
      freak_technology.delete
      freak_technology
      end
    end
  end
end
