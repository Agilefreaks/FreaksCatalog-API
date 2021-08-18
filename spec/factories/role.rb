# frozen_string_literal: true

FactoryBot.define do
  factory :role, class: 'Role' do
    name { 'Software developer' }

    trait :software_developer do
      name { 'Founder' }
    end
  end
end
