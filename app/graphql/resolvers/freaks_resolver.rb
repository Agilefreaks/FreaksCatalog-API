# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    argument :filter, Types::FreakFilterType, required: false

    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve(filter: nil)
      query = Freak.all.group(:id).order(:id)
      query = GetQuery.new.all_projects(filter, query)
      query = GetQuery.new.any_project(filter, query)
      query = GetQuery.new.all_technologies(filter, query)
      GetQuery.new.any_technology(filter, query)
    end
  end
end
