require 'rails_helper'

RSpec.describe "Admin::UserPlansController", type: :request do
  let(:admin) { create(:user, role: :admin, password: "password") }
  let(:client) { create(:user, role: :user, password: "password") }
  let(:plan) { create(:plan) }
  let!(:user_plan) { create(:user_plan, user: client, plan: plan) }
  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  def sign_out_user
    delete destroy_user_session_path
  end

  before do
    sign_in_user(admin)
  end

  describe "GET /admin/user_plans/:user_id/:plan_id" do
    context "when user plan exists" do
      it "returns http success and assigns the correct user plan" do
        get "/admin/user_plans/#{client.id}/#{plan.id}"

        expect(response).to have_http_status(:success)
        expect(assigns(:user_plan)).to eq(user_plan)
      end
    end

    context "when user plan does not exist" do
      it "redirects to admin_user_plans_path with alert" do
        get "/admin/user_plans/#{client.id}/-1"

        expect(response).to redirect_to(admin_plans_path)
        expect(flash[:alert]).to eq("Plán nebol najdený.")
      end
    end

    context "when client tries to access" do
      before do
        sign_out_user
        sign_in_user(client)
      end

      it "redirects to client dashboard" do
        get "/admin/user_plans/#{client.id}/#{plan.id}"

        expect(response).to redirect_to(client_dashboard_index_path)
      end
    end

    context "when user is not signed in" do
      before do
        sign_out_user
      end

      it "redirects to login page" do
        get "/admin/user_plans/#{client.id}/#{plan.id}"

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
