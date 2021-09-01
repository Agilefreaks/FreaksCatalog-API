# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    argument :filter, Types::FreakFilterType, required: false

    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve(filter: nil)
      all_of_project_ids = filter&.dig(:project_ids, :all_of)
      any_of_project_ids = filter&.dig(:project_ids, :any_of)

      query = Freak.all if filter.nil?

      if all_of_project_ids.present?
        query = Freak
                .joins(:freaks_projects)
                .having('array_agg(freaks_projects.project_id) @> ARRAY[:ids]::bigint[]', ids: all_of_project_ids)
                .group(:id)
                .order(:id)
      end

      if any_of_project_ids.present?
        query = Freak
                .joins(:freaks_projects)
                .where('freaks_projects.project_id = ANY(ARRAY[:ids]::bigint[])', ids: any_of_project_ids)
                .group(:id)
                .order(:id)
      end

      query
    end
  end
end
