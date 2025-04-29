require 'rails_helper'

RSpec.describe "Client::SessionSlots", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:client) { create(:user, role: :user, admin: admin) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(client)
  end

  describe "GET /client/session_slots" do
    let!(:session_slot1) { create(:session_slot, physiotherapist: admin, available_at: 2.days.from_now) }
    let!(:session_slot2) { create(:session_slot, physiotherapist: admin, available_at: 3.days.from_now) }

    it "shows available session slots from client's admin" do
      get client_session_slots_path
      expect(response).to have_http_status(:ok)

      expect(response.body).to include(session_slot1.name)
      expect(response.body).to include(session_slot2.name)
    end

    it "does not show reserved session slots" do
      # Reserve session_slot1
      create(:appointment, session_slot: session_slot1, status: :approved, client: client)

      get client_session_slots_path
      expect(response).to have_http_status(:ok)

      expect(assigns(:session_slots)).not_to include(session_slot1)
      expect(assigns(:session_slots)).to include(session_slot2)
    end
  end
end
