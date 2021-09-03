# frozen_string_literal: true

module Resolvers
  class GetQuery
    def all_projects(filter, query)
      all_of_project_ids = filter&.dig(:project_ids, :all_of)
      query = query.on_all_projects(all_of_project_ids) if all_of_project_ids.present?
      query
    end

    def any_project(filter, query)
      any_of_project_ids = filter&.dig(:project_ids, :any_of)
      query = query.on_any_project(any_of_project_ids) if any_of_project_ids.present?
      query
    end

    def all_technologies(filter, query)
      all_of_technology_ids = filter&.dig(:technology_ids, :all_of)
      query = QueryFilter.new.all_of_technology_id_sql(query, all_of_technology_ids) if all_of_technology_ids.present?
      query
    end

    def any_technology(filter, query)
      any_of_technology_ids = filter&.dig(:technology_ids, :any_of)
      query = QueryFilter.new.any_of_technology_id_sql(query, any_of_technology_ids) if any_of_technology_ids.present?
      query
    end
  end
end
