# frozen_string_literal: true

FactoryBot.define do
  factory :freak, class: 'Freak' do
    first_name { 'john' }
    last_name { 'doe' }
    description { 'a simple freak' }
    email { 'freak@gmail.com' }

    after(:build) do |freak|
      freak.photo = build(:photo, imageable: freak)
      create(:technology, freak: freak)
    end
  end
end
