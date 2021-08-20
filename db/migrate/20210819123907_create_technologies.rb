# frozen_string_literal: true

class CreateTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
