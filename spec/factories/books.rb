FactoryBot.define do
  sequence :title do |n|
    "Book title #{n}"
  end

  factory :book do
    title
    group

    trait :invalid do
      title { nil }
    end
  end
end
