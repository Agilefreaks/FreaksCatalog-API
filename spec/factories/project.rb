# frozen_string_literal: true

FactoryBot.define do
  factory :project, class: 'Project' do
    name { 'EPIX' }
    description { 'An American premium cable and satellite TV network.' }

    after(:build) do |project|
      project.logoUrl = create(:photo, imageable: project)
      project.technologies = create_list(:technology, 1, :ruby)
      project.freaks = create_list(:freak, 1)
    end
  end
end
