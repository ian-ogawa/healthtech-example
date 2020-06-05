require 'factory_bot'

FactoryBot.define do
  factory :hospital do
    name { Faker::Name.last_name }
    descriptions { Faker::Lorem.sentences(number: 1).first }
  end
end