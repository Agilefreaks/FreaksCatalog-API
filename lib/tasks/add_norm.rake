namespace :add_freak_with_a_norm do
  desc "Add a freak with a norm"
    ENV['development'] = 'true'
    task add_db: :environment do
      Freak.create(description: "the best", first_name: "Petrache", last_name: "Flavius", email: "petrache.flavius@gmail.com", norm_id: "1")
    end
  end