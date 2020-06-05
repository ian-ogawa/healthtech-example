require 'rails_helper'

RSpec.describe UserDoctor, type: :model  do
	let!(:doctors) { create_list(:doctor, 2) }
	let!(:customers) { create_list(:customer, 2) }
	let!(:bookings) { create_list(:booking, 2, { user_id: customers.first.id, doctor_id: doctors.first.id }) }
  let!(:params) do
    {
      doctor_id: doctors.first.id
    }
  end

  it { should belong_to(:customer) }
  it { should belong_to(:doctor) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:schedule_date) }
  it { should validate_presence_of(:phone) }

  it { should define_enum_for(:status).with_values([:booked, :completed, :cancelled]) }

  describe 'scope open_book' do
    it 'returns list booked bookings' do
      expect(doctors.first.doctor_users.open_book).to eq(UserDoctor.where(doctor_id: doctors.first.id, status: :booked))
      expect(doctors.first.doctor_users.open_book.count).to eq(2)
    end
  end

  describe '#is_valid_time?' do
    context "total_open_book <= 10 and (opening_time - Time.now) > 30.minutes" do
      it 'returns true' do
        params["schedule_date(1i)"] = 2020
        params["schedule_date(2i)"] = Time.now.day
        params["schedule_date(3i)"] = Time.now.month

        doctors.first.update(opening: (Time.now + 35.minutes).strftime("%H:%M"))
        expect(UserDoctor.is_valid_time?(params)).to eq(true)
      end
    end

    context "total_open_book is not <= 10 or (opening_time - Time.now) is not > 30.minutes" do
      it 'returns false' do
        params["schedule_date(1i)"] = 2020
        params["schedule_date(2i)"] = Time.now.day
        params["schedule_date(3i)"] = Time.now.month

        expect(UserDoctor.is_valid_time?(params)).to eq(false)
      end
    end
  end
end