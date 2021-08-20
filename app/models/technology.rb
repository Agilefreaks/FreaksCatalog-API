# frozen_string_literal: true

class Technology < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
