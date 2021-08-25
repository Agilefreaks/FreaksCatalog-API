# frozen_string_literal: true

class ProjectTechnology < ApplicationRecord
  self.table_name = 'projects_technologies'
  belongs_to :project
  belongs_to :technology
end
