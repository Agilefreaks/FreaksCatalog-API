# frozen_string_literal: true

require 'json'

module Resolvers
  class RolesResolver < Resolvers::Base
    type Types::RoleType.connection_type, null: false

    def resolve
      Role.all
    end
  end
end
