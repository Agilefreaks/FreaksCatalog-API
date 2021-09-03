# frozen_string_literal: true

module Resolvers
  class QueryFilter
    def any_of_technology_id_sql(query, id)
      query
        .joins(:freaks_technologies)
        .where(freaks_technologies: { technology_id: id })
    end
  end
end
