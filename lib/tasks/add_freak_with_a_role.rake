# frozen_string_literal: true

namespace :add_freak_with_a_role do
  desc 'Add a freak with a role'
  ENV['development'] = 'true'
  task add_freak_in_db: :environment do
    Freak.create(description: 'the best', first_name: 'Petrache', last_name: 'Flavius',
                 email: 'petrache.flavius@gmail.com', role_id: '1')
  end
end
