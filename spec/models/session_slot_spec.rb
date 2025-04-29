require 'rails_helper'

RSpec.describe SessionSlot, type: :model do
  describe "associations" do
    it "belongs to a physiotherapist (User)" do
      session_slot = create(:session_slot)
      expect(session_slot.physiotherapist).to be_a(User)
    end
  end

  describe "validations" do
    it "is valid with valid attributes" do
      session_slot = build(:session_slot)
      expect(session_slot).to be_valid
    end

    it "is invalid without a name" do
      session_slot = build(:session_slot, name: nil)
      expect(session_slot).to be_invalid
      expect(session_slot.errors[:name]).to include("can't be blank")
    end

    it "is invalid without available_at" do
      session_slot = build(:session_slot, available_at: nil)
      expect(session_slot).to be_invalid
      expect(session_slot.errors[:available_at]).to include("can't be blank")
    end

    it "is invalid without duration" do
      session_slot = build(:session_slot, duration: nil)
      expect(session_slot).to be_invalid
      expect(session_slot.errors[:duration]).to include("can't be blank")
    end

    it "is invalid without physiotherapist" do
      session_slot = build(:session_slot, physiotherapist: nil)
      expect(session_slot).to be_invalid
      expect(session_slot.errors[:physiotherapist]).to include("must exist")
    end
  end
end
