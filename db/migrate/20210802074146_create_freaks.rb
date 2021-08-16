# frozen_string_literal: true

class CreateFreaks < ActiveRecord::Migration[6.1]
  def change
    create_table :freaks do |t|
      t.string :first_name
      t.string :last_name
      t.string :description
      t.string :email

      t.timestamps
    end
  end
end
