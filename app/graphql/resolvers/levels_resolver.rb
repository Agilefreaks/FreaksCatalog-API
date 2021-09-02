# frozen_string_literal: true

module Resolvers
  class LevelsResolver < Resolvers::Base
    type [Types::LevelType], null: false

    def resolve
      Level.all
    end
  end
end
