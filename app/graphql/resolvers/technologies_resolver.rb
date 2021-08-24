# frozen_string_literal: true

require 'json'

module Resolvers
  class TechnologiesResolver < Resolvers::Base
    type [Types::TechnologyType], null: false

    # :reek:UtilityFunction
    def resolve
      Technology.all
    end
  end
end
