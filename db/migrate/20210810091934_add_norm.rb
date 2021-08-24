# frozen_string_literal: true

class AddNorm < ActiveRecord::Migration[6.1]
  def up
    create_table :norms do |t|
      t.string :name

      t.timestamps
    end

    add_column :freaks, :norm_id, :bigint
    add_foreign_key :freaks, :norms
  end

  def down
    remove_column :freaks, :norm_id
    drop_table :norms
  end
end
