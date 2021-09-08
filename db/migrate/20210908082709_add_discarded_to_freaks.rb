class AddDiscardedToFreaks < ActiveRecord::Migration[6.1]
  def change
    add_column :freaks, :discarded_at, :datetime
    add_index :freaks, :discarded_at
  end
end
