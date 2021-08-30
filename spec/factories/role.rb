# frozen_string_literal: true

FactoryBot.define do
  factory :role, class: 'Role' do
    name { 'Founder' }

    trait :software_developer do
      name { 'IT Sibiu' }
    end
  end
end
