require 'rails_helper'

RSpec.describe "Healt endpoint", type: :request do
  describe "GET /health" do
    before { get '/health' }

    it "should return OK" do
      payload = JSON.parse(response.body)

      expect(payload).not_to be_empty
      expect(payload['api']).to eq('OK')
      expect(response).to have_http_status(:ok)
    end
  end
end
