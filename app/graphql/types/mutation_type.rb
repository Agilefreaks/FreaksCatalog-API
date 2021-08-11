# frozen_string_literal: true

module Types
  class MutationType < BaseObject
    field :freak_create, FreakType, null: false, resolver: Resolvers::FreakCreateResolver
    field :photo_create, Models::Photo, null: false, resolver: Resolvers::PhotoCreateResolver
    field :project_create, Models::Project, null: false, resolver: Resolvers::ProjectCreateResolver
  end
end
