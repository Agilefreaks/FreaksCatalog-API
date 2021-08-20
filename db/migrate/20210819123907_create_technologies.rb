class CreateTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :description
      t.belongs_to :freak, foreign_key: true

      t.timestamps
    end
  end
end
