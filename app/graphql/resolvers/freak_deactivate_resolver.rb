# frozen_string_literal: true
require 'discard'
module Resolvers
  class FreakDeactivateResolver < Resolvers::Base
    argument :id, GraphQL::Types::ID, required: true

    type GraphQL::Types::ID, null: true

    def resolve(id:)
      Freak.find(id).discard
    end
  end
end

