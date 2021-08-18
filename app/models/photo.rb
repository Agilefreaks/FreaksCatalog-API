# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :uri, presence: true
end
