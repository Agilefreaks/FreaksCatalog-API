FactoryBot.define do
  factory :role, class: 'Role' do
    name { 'Software developer' }

    trait :Founder do
      name { 'Software developer' }
    end

    trait :software_developer do
      name { 'Founder' }
    end
  end
end