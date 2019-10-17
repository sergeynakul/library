FactoryBot.define do
  sequence :name do |n|
    "Group name #{n}"
  end

  factory :group do
    name

    trait :invalid do
      name { nil }
    end
  end
end
