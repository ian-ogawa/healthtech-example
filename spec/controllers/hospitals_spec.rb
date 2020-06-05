require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe HospitalsController, type: :controller  do
  let!(:hospitals) { create_list(:hospital, 2) }
	let!(:hospital_id) { hospitals.first.id }
  let!(:doctor) { create(:doctor) }


  describe 'GET index' do
    before { get :index }

    it 'render template index' do
      should render_template('index')
    end

    it 'have success status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns hospitals' do
      expect(assigns(:hospitals)).to eq(hospitals)
      expect(assigns(:hospitals).count).to eq(2)
    end
  end

  describe 'GET show' do
    before { get :show, params: { id: hospital_id } }

    it 'render template show' do
      should render_template('show')
    end

    it 'have success status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns hospitals' do
      expect(assigns(:hospital)).to eq(hospitals.first)
    end
  end

  describe 'POST add_hospitals' do
    before do
      sign_in :user, doctor
    end

    before { post :add_hospitals, params: { hospital_id: hospital_id } }

    it 'redirect to hospitals show' do
      response.should redirect_to hospitals.first
    end

    it 'have redirect status' do
      expect(response).to have_http_status(:redirect)
    end

    it 'create new doctor hospitals' do
      expect{
        post :add_hospitals, params: { hospital_id: hospital_id }
      }.to change(DoctorHospital,:count).by(1)
    end
  end
end