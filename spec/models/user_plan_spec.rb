require 'rails_helper'

RSpec.describe UserPlan, type: :model do
  it "has valid factory" do
    user_plan = build(:user_plan)
    expect(user_plan).to be_valid
  end
end
