class Technology < ApplicationRecord
  belongs_to :freak

  validates :name, presence: true
  validates :description, presence: true
end
