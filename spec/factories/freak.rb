# frozen_string_literal: true

FactoryBot.define do
  factory :freak, class: 'Freak' do
    first_name { 'john' }
    last_name { 'doe' }
    description { 'a simple freak' }
    email { 'freak@gmail.com' }
    association(:role)
    association(:norm)
    association :level

    trait :with_project do
      after(:build) do |freak|
        freak.projects = create_list(:project, 1)
      end
    end

    trait :with_technology do
      after(:build) do |freak|
        freak.technologies = create_list(:technology, 1, :ruby)
      end
    end

    after(:build) do |freak|
      freak.photo = create(:photo, imageable: freak)
    end
  end
end
