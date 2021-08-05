# frozen_string_literal: true

class Freak < ApplicationRecord
  has_one :photo, as: :imageable, dependent: nil

  validates :name, presence: true

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
    [
      {
        id: '1',
        name: 'EPIX',
        description: 'An American premium cable and satellite TV network.',
        logoUrl: 'https://bit.ly/3y7afHO',
        technologies: [
          {
            id: '2',
            name: 'Ruby',
            description: 'A popular backend language.'
          }
        ]
      }
    ]
  end

  def role
    {
      id: '1',
      name: 'Founder'
    }
  end

  def level
    {
      id: '3',
      name: 'Advanced'
    }
  end

  def norm
    {
      id: '1',
      name: 'full-time'
    }
  end

  def speciality
    [
      {
        id: '2',
        name: 'Backend'
      }
    ]
  end
end
