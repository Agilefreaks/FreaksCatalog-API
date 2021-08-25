# frozen_string_literal: true

require 'json'

module Resolvers
  class ProjectResolver < Resolvers::Base
    type Types::FreakType.connection_type, null: false
    argument :id, GraphQL::Types::ID, required: true
    # :reek:UtilityFunction
    def resolve(id:)
      Freak.find(id)
    end
  end
end
