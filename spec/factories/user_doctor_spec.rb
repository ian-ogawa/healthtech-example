require 'factory_bot'

FactoryBot.define do
  factory :booking, class: 'UserDoctor' do
    name { Faker::Name.name }
		email { Faker::Internet.email }
		birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
		notes { Faker::Lorem.sentences(number: 1).first }
		phone { Faker::PhoneNumber.cell_phone }
		schedule_date { Time.now + 1.days }
		doctor_id { 1 }
		user_id { 1 }
  end
end