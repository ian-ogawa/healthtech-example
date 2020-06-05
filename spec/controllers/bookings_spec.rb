require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe BookingsController, type: :controller  do
  let!(:doctor) { create(:doctor) }
  let!(:customer) { create(:customer) }
  let!(:booking) { create(:booking, { user_id: customer.id, doctor_id: doctor.id }) }


  describe 'GET index' do
    context 'login user' do
      context 'current user are customer' do
        before do
          sign_in :user, customer
        end

        before { get :index }
        it 'render template index' do
          should render_template('index')
        end

        it 'have success status' do
          expect(response).to have_http_status(:success)
        end
      end

      context 'current user are doctor' do
        before do
          sign_in :user, doctor
        end

        before { get :index }
        it 'render template index' do
          should render_template('index')
        end

        it 'have success status' do
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end