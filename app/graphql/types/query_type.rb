# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :freaks, resolver: Resolvers::FreaksResolver
    field :norms, resolver: Resolvers::NormsResolver
    field :technologies, resolver: Resolvers::TechnologiesResolver
    field :projects, resolver: Resolvers::ProjectsResolver
    field :roles, resolver: Resolvers::RolesResolver
  end
end
