FactoryBot.define do
  factory :role, class: 'Role' do
    name { 'Founder' }

    trait :Founder do
      name { 'Founder' }
    end

    trait :software_developer do
      name { 'Software developer' }
    end
  end
end