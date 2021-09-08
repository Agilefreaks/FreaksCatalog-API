# frozen_string_literal: true

module Types
  class FreakTechnology < Types::BaseObject
    argument :id, GraphQL::Types::ID, required: false
    argument :freak_id, GraphQL::Types::ID, required: false
    argument :technology_id, GraphQL::Types::ID, required: false
  end
end