require 'rails_helper'

RSpec.describe "Admin::Appointments", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:client) { create(:user, role: :user) }
  let(:other_admin) { create(:user, role: :admin) }


  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(admin)
  end

  describe "GET /admin/appointments" do
    it "returns a successful response" do
      get admin_appointments_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /admin/appointments/:id" do
    let!(:session_slot) { create(:session_slot, physiotherapist: admin) }
    let!(:appointment) { create(:appointment, session_slot: session_slot, client: client) }

    it "updates the appointment status to approved" do
      patch admin_appointment_path(appointment), params: { status: "approved" }

      expect(response).to redirect_to(admin_appointments_path)
      follow_redirect!
      expect(flash[:notice]).to eq("Stav rezervácie bol aktualizovaný.")
      expect(appointment.reload.status).to eq("approved")
    end

    it "updates the appointment status to rejected" do
      patch admin_appointment_path(appointment), params: { status: "rejected" }

      expect(response).to redirect_to(admin_appointments_path)
      follow_redirect!
      expect(flash[:notice]).to eq("Stav rezervácie bol aktualizovaný.")
      expect(appointment.reload.status).to eq("rejected")
    end

    it "does not allow admin to update appointments of other physiotherapists" do
      other_session_slot = create(:session_slot, physiotherapist: other_admin)
      other_appointment = create(:appointment, session_slot: other_session_slot, client: client)

      patch admin_appointment_path(other_appointment), params: { status: "approved" }

      expect(response).to have_http_status(:not_found) # 404
    end
  end
end
