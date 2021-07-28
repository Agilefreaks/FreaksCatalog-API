module Types
  class FreakType < Types::BaseObject
    field :id, GraphQL::Types::ID
    field :name, String, null:false
    field photo, URI, null: false
    field :description, String, null:false
  end
end
