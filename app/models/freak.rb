# frozen_string_literal: true

class Freak < ApplicationRecord
  include Discard::Model
  # default_scope -> { kept }

  scope :on_all_projects, lambda { |ids|
    if ids.present?
      matching_freak_ids = group(:id)
                           .order(:id)
                           .joins(:freaks_projects)
                           .having('array_agg(freaks_projects.project_id) @> ARRAY[:ids]::bigint[]', ids: ids)
                           .select(:id)
      where(id: matching_freak_ids)
    else
      all
    end
  }

  scope :on_any_project, lambda { |ids|
    if ids.present?
      joins(:freaks_projects)
        .where(freaks_projects: { project_id: ids })
    else
      all
    end
  }

  scope :on_all_technologies, lambda { |ids|
    if ids.present?
      matching_freak_ids = group(:id)
                           .order(:id)
                           .joins(:freaks_technologies)
                           .having('array_agg(freaks_technologies.technology_id) @> ARRAY[:ids]::bigint[]', ids: ids)
                           .select(:id)
      where(id: matching_freak_ids)
    else
      all
    end
  }

  scope :on_any_technology, lambda { |ids|
    if ids.present?
      joins(:freaks_technologies)
        .where(freaks_technologies: { technology_id: ids })
    else
      all
    end
  }

  has_one :photo, as: :imageable, dependent: nil

  has_many :freaks_projects, dependent: nil, class_name: 'FreakProject'
  has_many :projects, through: :freaks_projects, dependent: nil

  has_many :freaks_technologies, dependent: nil, class_name: 'FreakTechnology'
  has_many :technologies, through: :freaks_technologies

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :role_id, presence: true
  validates :norm_id, presence: true

  belongs_to :level
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

  def specialties
    [
      {
        id: '2',
        name: 'Backend'
      }
    ]
  end
end
