require 'rails_helper'

RSpec.describe HealthcheckController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'responds with {"success": true}' do
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body).to eql('success' => true)
    end
  end
end
