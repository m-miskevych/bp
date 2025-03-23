require 'rails_helper'

RSpec.describe "Client::DashboardController", type: :request do
  let(:client) { create(:user, role: :user) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  describe "GET /client/dashboard/index" do
    context "when user is a client" do
      before do
        sign_in_user(client)
      end

      it "returns http success" do
        get client_dashboard_index_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not signed in" do
      it "redirects to the login page" do
        get client_dashboard_index_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "Dashboard statistics" do
    let!(:draft_plan) { create(:user_plan, user: client, status: :draft) }
    let!(:in_progress_plan) { create(:user_plan, user: client, status: :in_progress) }

    before do
      sign_in_user(client)
      get client_dashboard_index_path
    end

    it "assigns the correct counts for user plans" do
      expect(assigns(:user_plans_draft).count).to eq(1)
      expect(assigns(:user_plans_in_progress).count).to eq(1)
    end

    it "does not assign any completed plans" do
      expect(assigns(:user_plans_completed)).to be_nil
    end
  end
end
