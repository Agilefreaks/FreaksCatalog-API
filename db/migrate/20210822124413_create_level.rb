# frozen_string_literal: true

class CreateLevel < ActiveRecord::Migration[6.1]
  def up
    create_table :levels do |t|
      t.string :name
      t.timestamps
    end
    add_column :freaks, :level_id, :bigint
    add_foreign_key :freaks, :levels
  end

  def down
    remove_column :freaks, :level_id
    drop_table :levels
  end
end
