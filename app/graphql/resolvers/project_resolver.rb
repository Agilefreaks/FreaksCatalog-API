# frozen_string_literal: true

module Resolvers
  class ProjectResolver < Resolvers::Base
    type Types::ProjectType, null: false
    argument :id, GraphQL::Types::ID, required: true

    # :reek:UtilityFunction
    def resolve(id:)
      Project.find(id)
    end
  end
end
