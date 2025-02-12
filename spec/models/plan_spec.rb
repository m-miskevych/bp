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
    it "can be associated with exercises through exercises_plans" do
      plan = create(:plan)
      exercise = create(:exercise)

      create(:exercises_plan, plan: plan, exercise: exercise)

      expect(plan.exercises).to include(exercise)
    end

    it "can have many exercises through exercises_plans" do
      plan = create(:plan)
      exercise1 = create(:exercise)
      exercise2 = create(:exercise)

      create(:exercises_plan, plan: plan, exercise: exercise1)
      create(:exercises_plan, plan: plan, exercise: exercise2)

      expect(plan.exercises).to include(exercise1, exercise2)
    end

    it "destroys exercises_plans when the plan is destroyed" do
      plan = create(:plan)
      exercise1 = create(:exercise)
      exercise2 = create(:exercise)

      create(:exercises_plan, plan: plan, exercise: exercise1)
      create(:exercises_plan, plan: plan, exercise: exercise2)

      expect(ExercisesPlan.count).to eq(2)

      plan.destroy

      expect(ExercisesPlan.count).to eq(0)
    end
  end

  describe "translations" do
  end
end
