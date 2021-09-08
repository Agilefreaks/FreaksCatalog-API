# frozen_string_literal: true

module Resolvers
  class FreakDeactivateResolver < Resolvers::Base
    argument :id, GraphQL::Types::ID, required: true,
                                      validates: { in_db: { type: Freak } }

    type Types::FreakType, null: true

    def resolve(id:)
      freak = Freak.find(id)
      freak.discard
      freak
    end
  end
end
