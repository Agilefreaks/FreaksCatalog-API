# frozen_string_literal: true

# frozen_string_literal: truex``

FactoryBot.define do
  factory :freak, class: 'Freak' do
    first_name { 'john' }
    last_name { 'doe' }
    description { 'a simple freak' }
    email { 'freak@gmail.com' }

    trait :with_photo do
      association :photo
    end
  end
end
