# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    argument :filter, Types::FreakFilterType, required: false

    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve(filter: nil)
      query = Freak.all
                   .on_all_projects(filter&.dig(:project_ids, :all_of))
                   .on_all_technologies(filter&.dig(:technology_ids, :all_of))
                   .on_any_project(filter&.dig(:project_ids, :any_of))
      GetQuery.new.any_technology(filter, query)
    end
  end
end
