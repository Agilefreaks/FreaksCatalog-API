# frozen_string_literal: true

namespace :add_default_level do
  desc 'Add a freak with a level'
  task add_freak_in_db: :environment do
    Freak.where(level_id: nil).update(level_id: 1)
  end
end
