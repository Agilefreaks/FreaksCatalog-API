# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    argument :filter, Types::FreakFilterType, required: false

    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve(filter: nil)
      all_of_project_ids = filter&.dig(:project_ids, :all_of)
      any_of_project_ids = filter&.dig(:project_ids, :any_of)
      all_of_technology_ids = filter&.dig(:technology_ids, :all_of)
      any_of_technology_ids = filter&.dig(:technology_ids, :any_of)

      query = Freak.all.group(:id).order(:id)

      if all_of_project_ids.present?
        query = query
                .joins(:freaks_projects)
                .having('array_agg(freaks_projects.project_id) @> ARRAY[:ids]::bigint[]', ids: all_of_project_ids)

      end

      if any_of_project_ids.present?
        query = query
                .joins(:freaks_projects)
                .where(freaks_projects: { project_id: any_of_project_ids })
      end

      if all_of_technology_ids.present?
        query = query
                .joins(:freaks_technologies)
                .having('array_agg(freaks_technologies.technology_id) @> ARRAY[:ids]::bigint[]', ids: all_of_technology_ids)
      end

      if any_of_technology_ids.present?
        query = query
                .joins(:freaks_technologies)
                .where(freaks_technologies: { technology_id: any_of_technology_ids })
      end

      query
    end
  end
end
