require 'factory_bot'

FactoryBot.define do
  factory :hospital do
    title { Faker::Name.last_name }
    content { Faker::Lorem.sentences(number: 1).first }
  end
end