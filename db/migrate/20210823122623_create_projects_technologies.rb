# frozen_string_literal: true

class CreateProjectsTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_technologies do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :technology, foreign_key: true
      t.timestamps
    end
  end
end
