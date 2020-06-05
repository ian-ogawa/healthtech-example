require 'rails_helper'

RSpec.describe Hospital, type: :model  do
  it { should have_many(:doctor_hospitals).dependent(:destroy) }
  it { should have_many(:doctors) }

  it { should validate_presence_of(:name) }
end