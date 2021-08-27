# frozen_string_literal: true

FactoryBot.define do
  factory :norm, class: 'Norm' do
    name { 'full_time' }

    trait :part_time do
      name { 'part_time' }
    end
  end
end
