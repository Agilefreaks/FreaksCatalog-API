# frozen_string_literal: true

FactoryBot.define do
  factory :freak, class: 'Freak' do
    name { 'John Doe' }
    description { 'A simple freak.' }
    email { 'freak@gmail.com' }
  end
end
