FactoryBot.define do
  factory :author do
    name { 'Author name' }

    trait :invalid do
      name { nil }
    end
  end
end
