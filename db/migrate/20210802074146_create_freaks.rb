# frozen_string_literal: true

class CreateFreaks < ActiveRecord::Migration[6.1]
  def change
    create_table :freaks do |t|
      t.string :name
      t.string :description
      t.date :photo

      t.timestamps
    end
  end
end
