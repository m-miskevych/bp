require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "associations" do
    it "belongs to client and session_slot" do
      client = User.create!(email: "client@example.com", password: "password")
      physiotherapist = User.create!(email: "physio@example.com", password: "password")
      session_slot = SessionSlot.create!(name: "Session", available_at: Time.current, duration: 60, physiotherapist: physiotherapist)

      appointment = Appointment.create!(client: client, session_slot: session_slot, start_at: Time.current, end_at: 1.hour.from_now)

      expect(appointment.client).to eq(client)
      expect(appointment.session_slot).to eq(session_slot)
    end
  end

  describe "validations" do
    it "is invalid without start_at" do
      appointment = Appointment.new(start_at: nil)
      expect(appointment.valid?).to be_falsey
      expect(appointment.errors[:start_at]).to include("can't be blank")
    end

    it "is invalid without end_at" do
      appointment = Appointment.new(end_at: nil)
      expect(appointment.valid?).to be_falsey
      expect(appointment.errors[:end_at]).to include("can't be blank")
    end

    it "is invalid without session_slot_id" do
      appointment = Appointment.new(session_slot_id: nil)
      expect(appointment.valid?).to be_falsey
      expect(appointment.errors[:session_slot]).to include("must exist")
    end

    it "is invalid if the same session_slot is booked twice by the same client" do
      client = User.create!(email: "client2@example.com", password: "password")
      physiotherapist = User.create!(email: "physio2@example.com", password: "password")
      session_slot = SessionSlot.create!(name: "Test Session", available_at: Time.current, duration: 60, physiotherapist: physiotherapist)

      Appointment.create!(client: client, session_slot: session_slot, start_at: Time.current, end_at: 1.hour.from_now)
      duplicate = Appointment.new(client: client, session_slot: session_slot, start_at: Time.current + 1.day, end_at: Time.current + 1.day + 1.hour)

      expect(duplicate.valid?).to be_falsey
      expect(duplicate.errors[:session_slot_id]).to include("has already been booked by you")
    end
  end

  describe "enums" do
    it "statuses" do
      expect(Appointment.statuses).to eq(
        "pending" => 0,
        "approved" => 1,
        "rejected" => 2
      )
    end
  end
end
