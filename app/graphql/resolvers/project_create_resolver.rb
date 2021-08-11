# frozen_string_literal: true

module Resolvers
  class ProjectCreateResolver < Resolvers::Base
    argument :name, String, required: true
    argument :description, String, required: true

    type [Types::Models::Project], null: false

    # :reek:UtilityFunction
    def resolve(params)
      Project.create(params)
    end
  end
end
