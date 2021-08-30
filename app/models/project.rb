# frozen_string_literal: true

class Project < ApplicationRecord
  has_one :logo_url, as: :imageable, dependent: :destroy, class_name: 'Photo'

  has_many :freaks_projects, dependent: nil, class_name: 'FreakProject'
  has_many :freaks, through: :freaks_projects, dependent: nil

  has_many :projects_technologies, dependent: nil, class_name: 'ProjectTechnology'
  has_many :technologies, through: :projects_technologies

  validates :name, presence: true
  validates :description, presence: true
end
