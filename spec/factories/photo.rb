# frozen_string_literal: true

FactoryBot.define do
  factory :photo, class: 'Photo' do
    uri { 'http://www.something.ro' }
  end
end
