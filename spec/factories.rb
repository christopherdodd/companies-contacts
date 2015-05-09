require 'faker'

FactoryGirl.define do

  factory :contact do
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name}
    association :company
    position { Faker::Name.title}
  end

  factory :company do
    name { Faker::Company.name}
  end

end