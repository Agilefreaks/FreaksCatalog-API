# frozen_string_literal: true

module Types
  class FreakFilterType < Types::BaseInputObject
    argument :project_ids, ProjectIdFilterType, required: false
    argument :technology_ids, TechnologyIdFilterType, required: false
  end
end
