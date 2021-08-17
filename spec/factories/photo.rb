# frozen_string_literal: true

FactoryBot.define do
  factory :photo, class: 'Photo' do
    uri { 'http://www.something.ro' }
    association :imageable, factory: :freak
  end
end
