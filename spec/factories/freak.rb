# frozen_string_literal: true

FactoryBot.define do
  factory :freak, class: 'Freak' do
    name { 'name' }
    description { 'description ' }
  end
end
