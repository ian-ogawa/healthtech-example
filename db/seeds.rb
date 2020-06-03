require 'faker'

Hospital.destroy_all
User.destroy_all

15.times do
	User.create(
			name: Faker::Name.name,
			role: :customer,
			email: Faker::Internet.email,
			password: 123456789,
			password_confirmation: 123456789
		)
end

10.times do
	hospital = Hospital.create(
			name: "#{Faker::Name.last_name} Hospital",
			descriptions: Faker::Lorem.sentences(number: 1).first
		)

	5.times do
		user = User.create(
			name: Faker::Name.name,
			role: :doctor,
			email: Faker::Internet.email,
			password: 123456789,
			password_confirmation: 123456789
		)

		user.doctor_hospitals.create(hospital_id: hospital.id)
	end
end


