require "rails_helper"

RSpec.describe "Admin::PlansController", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:client) { create(:user, role: :user) }
  let(:plan) { create(:plan) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(admin)
  end

  describe "GET /admin/plans" do
    it "returns http success" do
      get admin_plans_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/plans/:id" do
    it "returns http success" do
      get admin_plan_path(plan)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/plans/new" do
    it "returns http success" do
      get new_admin_plan_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /admin/plans" do
    context "with valid params" do
      it "creates a new plan" do
        expect {
          post admin_plans_path, params: { plan: { name_sk: "Plán 1", name_en: "Plan 1", description_sk: "Popis", description_en: "Description" } }
        }.to change(Plan, :count).by(1)
        expect(response).to redirect_to(admin_plan_path(Plan.last))
        expect(flash[:notice]).to eq("Plán bol úspešne vytvorený.")
      end
    end

    context "with invalid params" do
      it "does not create a plan and renders 'new'" do
        expect {
          post admin_plans_path, params: { plan: { name_sk: "", name_en: "" } }
        }.not_to change(Plan, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH /admin/plans/:id" do
    context "with valid params" do
      it "updates the plan" do
        patch admin_plan_path(plan), params: { plan: { name_sk: "Updated Plan" } }
        plan.reload
        expect(plan.name_sk).to eq("Updated Plan")
        expect(response).to redirect_to(admin_plan_path(plan))
        expect(flash[:notice]).to eq("Plán bol úspešne upravený.")
      end
    end

    context "with invalid params" do
      it "does not update the plan and renders 'edit'" do
        patch admin_plan_path(plan), params: { plan: { name_sk: "", name_en: "" } }
        plan.reload
        expect(plan.name_sk).not_to eq("")
        expect(plan.name_en).not_to eq("")
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE /admin/plans/:id" do
    it "deletes the plan" do
      plan_to_delete = create(:plan)
      expect {
        delete admin_plan_path(plan_to_delete)
      }.to change(Plan, :count).by(-1)
      expect(response).to redirect_to(admin_plans_path)
      expect(flash[:alert]).to eq("Plán bol úspešne odstránený.")
    end
  end

  describe "GET /admin/plans/:id/assign" do
    it "returns http success" do
      get assign_admin_plan_path(plan)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /admin/plans/:id/assign_plan_to_client" do
    context "when plan is not already assigned" do
      it "assigns the plan to the client" do
        expect {
          post assign_plan_to_client_admin_plan_path(plan), params: { user_id: client.id }
        }.to change(client.plans, :count).by(1)
        expect(response).to redirect_to(admin_plans_path)
        expect(flash[:notice]).to eq("Plán bol úspešne priradený klientovi.")
      end
    end

    context "when plan is already assigned" do
      before do
        client.plans << plan
      end

      it "does not assign the plan again and shows an alert" do
        expect {
          post assign_plan_to_client_admin_plan_path(plan), params: { user_id: client.id }
        }.not_to change(client.plans, :count)
        expect(response).to redirect_to(admin_plans_path)
        expect(flash[:alert]).to eq("Tento klient už má tento plán priradený!")
      end
    end
  end

  describe "DELETE /admin/plans/:id/remove_plan_from_client" do
    context "when plan is assigned to the client" do
      before do
        client.plans << plan
      end

      it "removes the plan from the client" do
        expect {
          delete remove_plan_from_client_admin_plan_path(plan), params: { user_id: client.id }
        }.to change(client.plans, :count).by(-1)
        expect(response).to redirect_to(admin_user_path(client))
        expect(flash[:notice]).to eq("Plán bol úspešne odstránený.")
      end
    end

    context "when plan is not assigned to the client" do
      it "does not remove anything and shows an alert" do
        expect {
          delete remove_plan_from_client_admin_plan_path(plan), params: { user_id: client.id }
        }.not_to change(client.plans, :count)
        expect(response).to redirect_to(admin_user_path(client))
        expect(flash[:alert]).to eq("Tento plán nebol priradený k ziadnomu klientovi.")
      end
    end
  end
end
