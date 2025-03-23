require 'rails_helper'

RSpec.describe "Client::UserPlansController", type: :request do
  let(:client) { create(:user, role: :user) }
  let(:other_user) { create(:user, role: :user) }
  let!(:user_plan_draft) { create(:user_plan, user: client, status: :draft) }
  let!(:user_plan_in_progress) { create(:user_plan, user: client, status: :in_progress) }
  let!(:user_plan_done) { create(:user_plan, user: client, status: :done) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(client)
  end

  describe "GET /client/user_plans" do
    it "returns http success and assigns user plans" do
      get client_user_plans_path
      expect(response).to have_http_status(:success)
      expect(assigns(:user_plans)).to include(user_plan_draft, user_plan_in_progress, user_plan_done)
    end
  end

  describe "GET /client/user_plans/:id" do
    context "when user owns the plan" do
      it "returns http success and assigns the correct user plan" do
        get client_user_plan_path(user_plan_draft)
        expect(response).to have_http_status(:success)
        expect(assigns(:user_plan)).to eq(user_plan_draft)
      end
    end

    context "when user tries to access another user's plan" do
      let(:other_plan) { create(:user_plan, user: other_user) }

      it "returns http not found" do
        get client_user_plan_path(other_plan)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH /client/user_plans/:id/start" do
    context "when the plan is in draft status" do
      it "updates the plan to in_progress and redirects" do
        patch start_client_user_plan_path(user_plan_draft)
        expect(response).to redirect_to(client_user_plan_path(user_plan_draft))
        follow_redirect!
        expect(user_plan_draft.reload.status).to eq("in_progress")
      end
    end

    context "when the plan is not in draft status" do
      it "does not update the plan and redirects with an alert" do
        patch start_client_user_plan_path(user_plan_done)
        expect(response).to redirect_to(client_user_plan_path(user_plan_done))
        follow_redirect!
        expect(user_plan_done.reload.status).to eq("done")
      end
    end
  end

  describe "PATCH /client/user_plans/:id/complete" do
    context "when the plan is in progress" do
      it "updates the plan to done and redirects" do
        patch complete_client_user_plan_path(user_plan_in_progress)
        expect(response).to redirect_to(client_user_plan_path(user_plan_in_progress))
        follow_redirect!
        expect(user_plan_in_progress.reload.status).to eq("done")
      end
    end

    context "when the plan is not in progress" do
      it "does not update the plan and redirects with an alert" do
        patch complete_client_user_plan_path(user_plan_draft)
        expect(response).to redirect_to(client_user_plan_path(user_plan_draft))
        follow_redirect!
        expect(user_plan_draft.reload.status).to eq("draft")
      end
    end
  end
end
