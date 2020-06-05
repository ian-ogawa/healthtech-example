require 'rails_helper'

RSpec.describe HomeController, type: :controller  do

  describe 'GET index' do
    before { get :index }

    it 'render template index' do
      should render_template('index')
    end

    it 'have success status' do
      expect(response).to have_http_status(:success)
    end
  end
end