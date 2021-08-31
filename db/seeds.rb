# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seeds
  class << self
    def run
      Technology.find_or_create_by!(name: 'Java', description: 'Java is a popular language')
      ruby = Technology.find_or_create_by!(name: 'Ruby', description: 'Ruby is a popular language')

      rails = Project.find_or_create_by!(name: 'EPIX',
                                         description: 'An American premium cable and satellite TV network.') do |project|
        project.technologies << ruby
      end

      full_time = Norm.find_or_create_by!(name: "Full time")
      Norm.find_or_create_by!(name: "Part time")
      founder = Role.find_or_create_by!(name: "Founder")

      ['Founder', 'IT Sibiu', 'IT Cluj', 'Team assistant'].each do |roles|
        Role.find_or_create_by!(name: roles)
      end

      rails.logo_url = Photo.find_or_create_by!(uri: 'www.url.ro', imageable: rails)
      rails.logo_url = Photo.find_or_create_by(uri: 'www.url.ro', imageable: rails)

      level=Level.find_or_create_by(name: "Intern")
      %w[Intern Novice Advanced Competent Proficient Expert Master].each do |level_name|
        Level.find_or_create_by(name: level_name)
      end

      Freak.find_or_create_by(
        first_name: 'John',
        last_name: 'Doe',
        email: 'freak@gmail.com',
        description: 'A freak'
      ) do |freak|
        freak.technologies << ruby
        freak.projects << rails
        freak.level = level
        freak.norm = full_time
        freak.role = founder
      end
    end
  end
end

Seeds.run unless Rails.env.test?