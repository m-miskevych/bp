require 'rails_helper'

RSpec.describe "Client::Appointments", type: :request do
  let(:client) { create(:user, role: :user) }
  let(:session_slot) { create(:session_slot) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(client)
  end

  describe "GET /client/appointments" do
    it "returns a successful response" do
      get client_appointments_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /client/appointments/new" do
    it "returns a successful response" do
      get new_client_appointment_path(session_slot_id: session_slot.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /client/appointments" do
    context "with valid parameters" do
      it "creates a new appointment and redirects" do
        expect {
          post client_appointments_path, params: {
            appointment: {
              session_slot_id: session_slot.id,
              start_at: session_slot.available_at,
              end_at: session_slot.available_at + session_slot.duration.minutes,
              notes: "Looking forward!"
            }
          }
        }.to change(Appointment, :count).by(1)

        expect(response).to redirect_to(client_session_slots_path)
        follow_redirect!
        expect(flash[:notice]).to eq("Rezervácia bola úspešne vytvorená!")
      end
    end

    context "with invalid parameters" do
      it "does not create an appointment and re-renders new template" do
        expect {
          post client_appointments_path, params: {
            appointment: {
              session_slot_id: nil, # neplatné
              start_at: nil,
              end_at: nil
            }
          }
        }.not_to change(Appointment, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /client/appointments/:id" do
    let!(:appointment) { create(:appointment, client: client, session_slot: session_slot) }

    it "deletes the appointment and redirects" do
      expect {
        delete client_appointment_path(appointment)
      }.to change(Appointment, :count).by(-1)

      expect(response).to redirect_to(client_appointments_path)
      follow_redirect!
      expect(flash[:notice]).to eq("Rezervácia bola úspešne zrušená.")
    end
  end
end
