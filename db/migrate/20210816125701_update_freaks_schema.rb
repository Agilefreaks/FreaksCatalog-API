# frozen_string_literal: true

class UpdateFreaksSchema < ActiveRecord::Migration[6.1]
  def change
    add_column :freaks, :first_name, :string
    add_column :freaks, :last_name, :string
    add_column :freaks, :email, :string

    remove_column :freaks, :name, :string
    remove_column :freaks, :photo, :date
  end
end
