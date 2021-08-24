# frozen_string_literal: true

namespace :freaks do
  desc 'Add a freak with a norm'
  task add_default_norm_for_freaks_without_norm: :environment do
    Freak
      .where(norm_id: nil)
      .update(norm_id: 1)
  end
end
