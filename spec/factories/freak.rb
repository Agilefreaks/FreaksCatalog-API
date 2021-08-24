# frozen_string_literal: true

FactoryBot.define do
  factory :freak, class: 'Freak' do
    first_name { 'john' }
    last_name { 'doe' }
    description { 'a simple freak' }
    email { 'freak@gmail.com' }

    after(:build) do |freak|
      freak.photo = create(:photo, imageable: freak)
      freak.technologies = create_list(:technology, 1, :ruby)
      freak.projects = create_list(:project, 1)
    end
  end
end
