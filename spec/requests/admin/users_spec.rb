require 'rails_helper'

RSpec.describe "Admin::UsersController", type: :request do
  let(:admin) { create(:user, role: :admin, password: "password") }
  let!(:client1) { create(:user, role: :user, password: "password", admin: admin) }
  let!(:client2) { create(:user, role: :user, password: "password", admin: admin) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(admin)
  end

  describe "GET /admin/users" do
    it "returns http success" do
      get admin_users_path
      expect(response).to have_http_status(:success)

      expect(assigns(:clients)).to include(client1, client2)
    end
  end

  describe "GET /admin/users/:id" do
    it "returns http success and assigns the correct user" do
      get admin_user_path(client1)
      expect(response).to have_http_status(:success)
      expect(assigns(:client)).to eq(client1)
    end
  end

  describe "POST /admin/users" do
    context "with valid params" do
      it "invites a new user and redirects" do
        expect {
          post admin_users_path, params: { user: { email: "newuser@example.com", name: "New User" } }
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(admin_users_path)
        expect(flash[:notice]).to eq(I18n.t("notices.user_invited"))
      end
    end

    context "with invalid params" do
      it "does not invite a new user and re-renders the new template" do
        post admin_users_path, params: { user: { email: "", name: "Invalid User" } }
        expect(response).to render_template(:new)
        expect(assigns(:client).errors.any?).to be_truthy
      end
    end
  end

  describe "DELETE /admin/users/:id" do
    it "destroys the user and redirects" do
      user_to_delete = create(:user, role: :user, admin: admin)
      expect {
        delete admin_user_path(user_to_delete)
      }.to change(User, :count).by(-1)
      expect(response).to redirect_to(admin_users_path)
      expect(flash[:notice]).to eq("Uživatel bol úspešne odstranený.")
    end
  end
end
