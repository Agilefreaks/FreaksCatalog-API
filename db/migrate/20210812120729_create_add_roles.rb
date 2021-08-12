class CreateAddRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :add_roles do |t|
      t.string :name
      t.string :id

      t.timestamps
    end
    add_index :add_roles, :id
  end
end
