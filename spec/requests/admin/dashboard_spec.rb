require 'rails_helper'

RSpec.describe "Admin::DashboardController", type: :request do
  let(:admin) { create(:user) }
  let(:user) { create(:user, role: :user) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  describe "GET /admin/dashboard/index" do
    context "when user is an admin" do
      before do
        sign_in_user(admin)
      end

      it "returns http success" do
        get admin_dashboard_index_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not an admin" do
      before do
        sign_in_user(user)
      end

      it "redirects to client dashboard" do
        get admin_dashboard_index_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(client_dashboard_index_path)
      end
    end

    context "when user is not signed in" do
      it "redirects to login page" do
        get admin_dashboard_index_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "Dashboard statistics" do
    let!(:exercise1) { create(:exercise) }
    let!(:exercise2) { create(:exercise) }
    let!(:plan) { create(:plan) }
    let!(:client1) { create(:user) }
    let!(:client2) { create(:user) }

    before do
      sign_in_user(admin)
      get admin_dashboard_index_path
    end

    it "assigns the correct total counts" do
      expect(assigns(:total_exercises)).to eq(2)
      expect(assigns(:total_plans)).to eq(1)
      expect(assigns(:total_clients)).to eq(admin.users.count)
    end
  end
end
