# frozen_string_literal: true

namespace :add_default_level do
  desc 'Add a default level_id if the freak have a null level_id'
  task add_a_default_level_id_if_not_exist: :environment do
    Freak.where(level_id: nil).update(level_id: 1)
  end
end
