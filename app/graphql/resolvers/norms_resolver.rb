# frozen_string_literal: true

require 'json'

module Resolvers
  class NormsResolver < Resolvers::Base
    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve
      Norm.all
    end
  end
end
