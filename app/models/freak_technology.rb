# frozen_string_literal: true

class FreakTechnology < ApplicationRecord
  self.table_name = 'freaks_technologies'
  belongs_to :technology
  belongs_to :freak
end
