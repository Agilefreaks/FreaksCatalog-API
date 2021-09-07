# frozen_string_literal: true

module Resolvers
  class FreakUpdateResolver < Resolvers::Base
    argument :input, Types::FreakUpdateInputType, required: true

    type Types::FreakType, null: false

    def resolve(input:)
      freak = Freak.find(input[:id])

      return unless freak

      freak.update(input.to_h)
      freak
    end
  end
end
