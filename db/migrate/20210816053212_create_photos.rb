# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :uri
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
