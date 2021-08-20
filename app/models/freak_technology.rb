# frozen_string_literal: true

class FreakTechnology < ApplicationRecord
  belongs_to :technology
  belongs_to :freak
end
