require 'rails_helper'

RSpec.describe UsersController, type: :controller  do
	let!(:doctors) { create_list(:doctor, 2) }

  describe 'GET index' do
    before { get :index }

    it 'render template index' do
      should render_template('index')
    end

    it 'have success status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns doctors' do
      expect(assigns(:doctors)).to eq(doctors)
      expect(assigns(:doctors).count).to eq(2)
    end
  end
end