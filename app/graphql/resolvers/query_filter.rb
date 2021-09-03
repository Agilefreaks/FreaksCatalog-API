# frozen_string_literal: true

module Resolvers
  class QueryFilter
    def all_of_technology_id_sql(query, id)
      query
        .joins(:freaks_technologies)
        .having('array_agg(freaks_technologies.technology_id) @> ARRAY[:ids]::bigint[]', ids: id)
    end

    def any_of_technology_id_sql(query, id)
      query
        .joins(:freaks_technologies)
        .where(freaks_technologies: { technology_id: id })
    end
  end
end
