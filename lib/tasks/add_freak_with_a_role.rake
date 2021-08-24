# frozen_string_literal: true

namespace :add_freak_with_a_role do
  desc 'Add a freak with a role'
  task add_freak_in_db: :environment do
    Freak.where(role_id: nil).update(role_id: 1)
  end
end
