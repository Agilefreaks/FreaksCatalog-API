# frozen_string_literal: true

FactoryBot.define do
  factory :level, class: 'Level' do
    name { 'Advanced' }
    trait :Beginner do
      name { 'Beginner' }
    end
  end
end
