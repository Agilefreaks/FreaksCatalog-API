# frozen_string_literal: true

require 'json'

module Resolvers
  class RolesResolver < Resolvers::Base
    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve
      Role.all
    end
  end
end
