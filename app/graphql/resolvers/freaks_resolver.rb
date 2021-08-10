# frozen_string_literal: true

require 'json'

module Resolvers
  class FreaksResolver < Resolvers::Base
    type Types::FreakType.connection_type, null: false

    # :reek:UtilityFunction
    def resolve
      Freak.all
    end
  end
end
