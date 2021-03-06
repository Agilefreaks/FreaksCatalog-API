# frozen_string_literal: true

module Resolvers
  class NormsResolver < Resolvers::Base
    type [Types::NormType], null: false

    def resolve
      Norm.all
    end
  end
end
