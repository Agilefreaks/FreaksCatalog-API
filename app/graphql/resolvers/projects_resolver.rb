# frozen_string_literal: true

module Resolvers
  class ProjectsResolver < Resolvers::Base
    type [Types::ProjectType], null: false

    # :reek:UtilityFunction
    def resolve
      Project.all
    end
  end
end
