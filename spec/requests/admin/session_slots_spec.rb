require 'rails_helper'

RSpec.describe "Admin::SessionSlots", type: :request do
  let(:admin) { create(:user, role: :admin) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(admin)
  end

  describe "GET /admin/session_slots" do
    let!(:session_slot1) { create(:session_slot, physiotherapist: admin) }
    let!(:session_slot2) { create(:session_slot, physiotherapist: admin) }

    it "returns a successful response and shows created session slots" do
      get admin_session_slots_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(session_slot1.name)
      expect(response.body).to include(session_slot2.name)
    end
  end

  describe "GET /admin/session_slots/new" do
    it "returns a successful response" do
      get new_admin_session_slot_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /admin/session_slots" do
    context "with valid parameters" do
      it "creates a new session slot and redirects" do
        expect {
          post admin_session_slots_path, params: {
            session_slot: {
              name: "New Slot",
              location: "Test Location",
              description: "Test description",
              available_at: 3.days.from_now,
              duration: 90
            }
          }
        }.to change(SessionSlot, :count).by(1)

        expect(response).to redirect_to(admin_session_slots_path)
        follow_redirect!
        expect(flash[:notice]).to eq("Termín bol úspešne vytvorený.")
      end
    end

    context "with invalid parameters" do
      it "does not create a session slot and re-renders the new template" do
        expect {
          post admin_session_slots_path, params: {
            session_slot: {
              name: "", # invalid
              available_at: nil,
              duration: nil
            }
          }
        }.not_to change(SessionSlot, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
