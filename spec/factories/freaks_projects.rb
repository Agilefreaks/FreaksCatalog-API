# frozen_string_literal: true

FactoryBot.define do
  factory :freaks_projects, class: 'FreakProject' do
    freak { create(:freak) }
    project { create(:project) }
  end
end
