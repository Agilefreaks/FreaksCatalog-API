# frozen_string_literal: true

class CreateFreaksTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :freaks_technologies do |t|
      t.belongs_to :freak, foreign_key: true
      t.belongs_to :technology, foreign_key: true

      t.timestamps
    end
  end
end
