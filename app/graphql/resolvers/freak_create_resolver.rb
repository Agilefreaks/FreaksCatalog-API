# frozen_string_literal: true

module Resolvers
  class FreakCreateResolver < Resolvers::Base
    argument :input, Types::FreakCreateInputType, required: true

    type Types::FreakType, null: false

    def resolve(input:)
      norm = Norm.find(input[:norm_id])
      role = Role.find(input[:role_id])
      level = Level.find(input[:level_id])

      Freak.create(input.to_h.merge(norm: norm, role: role, level: level))
    end
  end
end
