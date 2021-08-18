# frozen_string_literal: true

module Types
  class PhotoType < Types::BaseObject
    field :id, GraphQL::Types::ID, null: false
    field :imageable_type, String, null: false
    field :imageable_id, String, null: false
    field :uri, Types::Url, null: false
  end
end
