# frozen_string_literal: true

FactoryBot.define do
  factory :norm, class: 'Norm' do
    name { 'full_time' }

    trait :full_time do
      name { 'full_time' }
    end

    trait :part_time do
      name { 'part_time' }
    end
  end
end
