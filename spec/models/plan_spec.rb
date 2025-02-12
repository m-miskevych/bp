require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:plan) { create(:plan) }

  describe "validations" do
    it "is valid with a name and description" do
      expect(plan).to be_valid
    end

    it "is invalid without a name" do
      plan.name = nil
      expect(plan).not_to be_valid
    end

    it "is invalid without a description" do
      plan.description = nil
      expect(plan).not_to be_valid
    end
  end

  describe "associations" do
  end

  describe "translations" do
  end
end
