# frozen_string_literal: true

FactoryBot.define do
  factory :project, class: 'Project' do
    name { 'EPIX' }
    description { 'An American premium cable and satellite TV network.' }

    trait :with_freak do
      after(:build) do |project|
        project.freaks = create_list(:freak, 1)
      end
    end

    after(:build) do |project|
      project.logo_url = create(:photo, imageable: project)
      project.technologies = create_list(:technology, 1, :ruby)
    end
  end
end
