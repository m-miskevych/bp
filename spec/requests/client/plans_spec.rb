require 'rails_helper'

RSpec.describe "Client::Plans", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/client/plans/index"
      expect(response).to have_http_status(:success)
    end
  end
end
