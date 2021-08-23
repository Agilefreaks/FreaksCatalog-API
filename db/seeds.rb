# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

class Seeds
  class << self
    def run
      Technology.create(name: 'Java', description: 'Java is a popular language')
      technology = Technology.create(name: 'Ruby', description: 'Ruby is a popular language')

      Freak.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'freak@gmail.com',
        description: 'A freak',
        technologies: [technology]
      )
    end
  end
end

Seeds.run unless Rails.env.test?
