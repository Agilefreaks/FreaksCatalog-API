# frozen_string_literal: true

FactoryBot.define do
  factory :level, class: 'Level' do
    name { 'Advanced' }
    trait :beginner do
      name { 'Beginner' }
    end
  end
end
