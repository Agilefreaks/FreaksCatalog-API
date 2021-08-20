# frozen_string_literal: true

class RenameFreaksTechnologies < ActiveRecord::Migration[6.1]
  def change
    rename_table :freaks_technologies, :freak_technologies
  end
end
