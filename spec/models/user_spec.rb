require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model  do
	let!(:doctors) { create_list(:doctor, 2) }
	let!(:customers) { create_list(:customer, 2) }
	let!(:bookings) { create_list(:booking, 2, { user_id: customers.first.id, doctor_id: doctors.first.id }) }

  it { should have_many(:doctor_hospitals).dependent(:destroy) }
  it { should have_many(:hospitals) }

  it { should have_many(:user_doctors).dependent(:destroy) }
  it { should have_many(:doctors) }

  it { should have_many(:doctor_users).dependent(:destroy) }
  it { should have_many(:customers) }

  it { should define_enum_for(:role).with_values([:customer, :doctor]) }

  describe 'scope role_doctors' do
    it 'returns list doctors' do
      expect(User.role_doctors.to_a).to eq(doctors)
      expect(User.role_doctors.count).to eq(2)
    end
  end

	describe '#get_total_open_book' do
    it 'returns total booked schedule' do
      expect(doctors.first.get_total_open_book).to eq(2)
    end
  end

  describe '#get_opening_time' do
  	context 'opening nil' do
	    it 'returns beginning of days' do
	      expect(doctors.first.get_opening_time).to eq(Time.now.beginning_of_day)
	    end
	  end

	  context 'opening not nil' do

	    it 'returns opening time' do
	  		doctors.last.update(opening: '09:00')

	      expect(doctors.last.get_opening_time).to eq(doctors.last.opening.strftime('%H:%M').to_time)
	    end
	  end
  end
end