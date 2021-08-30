# frozen_string_literal: true

namespace :add_freak_with_a_default_role_id do
  desc 'Add a default role_id to a freak if role_id is null'
  task add_freak_in_db: :environment do
    Freak.where(role_id: nil).update(role_id: 1)
  end
end
