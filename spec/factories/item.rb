
FactoryGirl.define do
  factory :item do
    name { Faker::Hipster.words(5) }
    user
  end
end
