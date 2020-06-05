require 'rails_helper'

RSpec.describe DoctorHospital, type: :model  do
  it { should belong_to(:doctor) }
  it { should belong_to(:hospital) }

  it { should validate_presence_of(:hospital_id) }
  it { should validate_presence_of(:user_id) }
end