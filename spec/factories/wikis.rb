FactoryGirl.define do
  factory :wiki do
    title Faker::DrWho.quote
    body Faker::Lorem.paragraph
    private false
    user
  end
end
