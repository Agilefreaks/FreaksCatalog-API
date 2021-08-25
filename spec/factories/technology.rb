# frozen_string_literal: true

FactoryBot.define do
  factory :technology do
    name { 'Ruby' }
    description { 'A popular back-end language' }

    trait :ruby do
      name { 'Ruby' }
      description { 'A popular back-end language' }
    end

    trait :java do
      name { 'Java' }
      description { 'One of the most popular programming languages' }
    end
  end
end
