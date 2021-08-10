# frozen_string_literal: true

FactoryBot.define do
  factory :photo, class: 'Photo' do
    uri { 'https://www.gravatar.com/avatar/00000000000000000000000000000000' }
  end
end
