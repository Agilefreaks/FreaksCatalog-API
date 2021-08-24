# frozen_string_literal: true

class CreateFreaksProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :freaks_projects do |t|
      t.belongs_to :freak
      t.belongs_to :project

      t.timestamps
    end
  end
end
