require 'factory_bot'

FactoryBot.define do
  factory :doctor, class: 'User' do
    name {Faker::Name.name }
		role { :doctor }
		email { Faker::Internet.email }
		password { 123456789 }
		password_confirmation { 123456789 }
  end

  factory :customer, class: 'User' do
    name {Faker::Name.name }
		role { :customer }
		email { Faker::Internet.email }
		password { 123456789 }
		password_confirmation { 123456789 }
  end

end
