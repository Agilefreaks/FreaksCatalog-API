# frozen_string_literal: true

class Freak < ApplicationRecord
  has_one :photo, as: :imageable, dependent: nil

  has_many :freaks_projects, dependent: nil, class_name: 'FreakProject'
  has_many :projects, through: :freaks_projects, dependent: nil

  has_many :freaks_technologies, dependent: nil, class_name: 'FreakTechnology'
  has_many :technologies, through: :freaks_technologies

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :norm_id, presence: true

  belongs_to :role
  belongs_to :norm
  def name
    "#{first_name} #{last_name}"
  end

  def skills
    [
      {
        id: '1',
        name: 'Project management'
      },
      {
        id: '2',
        name: 'AWS Architect'
      }
    ]
  end

  def projects
    JSON.parse(File.read('app/models/project_freak.json'))
  end

  def level
    {
      id: '3',
      name: 'Advanced'
    }
  end

  def specialties
    [
      {
        id: '2',
        name: 'Backend'
      }
    ]
  end
end
