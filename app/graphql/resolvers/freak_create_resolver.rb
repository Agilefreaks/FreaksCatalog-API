# frozen_string_literal: true

module Resolvers
  class FreakCreateResolver < Resolvers::Base
    argument :input, Types::FreakCreateInputType, required: true

    type Types::FreakType, null: false

    def resolve(params)
      norm = Norm.find(params[:norm_id])
      role = Role.find(params[:role_id])
      level = Level.find(params[:level_id])

      Freak.create(params.merge(norm: norm, role: role, level: level))
    end
  end
end
