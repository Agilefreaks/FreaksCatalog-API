# frozen_string_literal: true

class CreateAddRoles < ActiveRecord::Migration[6.1]
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    add_column :freaks, :role_id, :bigint
    add_foreign_key :freaks, :roles

    # add_index :roles, :id
  end
end
