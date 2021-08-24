# frozen_string_literal: true

class FreakProject < ApplicationRecord
  self.table_name = 'freaks_projects'
  belongs_to :freak
  belongs_to :project
end
