class Project < ApplicationRecord
  belongs_to :proj, polymorphic: true
  has_one :photo, as: :imageable, dependent: nil


  validates :name, presence: true
  validates :description, presence: true
end
