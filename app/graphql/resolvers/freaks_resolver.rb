# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    argument :filter, Types::FreakFilterType, required: false

    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve(filter: nil)
      query = Freak.all.group(:id).order(:id)
                   .on_all_projects(filter&.dig(:project_ids, :all_of))
                   .on_all_technologies(filter&.dig(:technology_ids, :all_of))
      query = GetQuery.new.any_project(filter, query)
      GetQuery.new.any_technology(filter, query)
    end
  end
end
