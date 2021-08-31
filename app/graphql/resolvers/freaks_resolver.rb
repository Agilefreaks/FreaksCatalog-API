# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    argument :filter, Types::FreakFilterType, required: false

    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve(filter: nil)
      query = Freak.all

      all_of_project_ids = filter&.dig(:project_ids, :all_of)

      if all_of_project_ids.present?
        query = query
                .joins(:freaks_projects)
                .having('array_agg(freaks_projects.project_id) @> ARRAY[:ids]::bigint[]', ids: all_of_project_ids)
                .group(:id)
      end

      query
    end
  end
end
