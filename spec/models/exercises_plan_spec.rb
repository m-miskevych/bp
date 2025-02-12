require 'rails_helper'

RSpec.describe ExercisesPlan, type: :model do
  describe "associations" do
    it "belongs to an exercise" do
      association = ExercisesPlan.reflect_on_association(:exercise)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to a plan" do
      association = ExercisesPlan.reflect_on_association(:plan)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe "validations" do
    it "is valid with an exercise and a plan" do
      exercise = create(:exercise)
      plan = create(:plan)
      exercises_plan = build(:exercises_plan, exercise: exercise, plan: plan)
      expect(exercises_plan).to be_valid
    end

    it "is invalid without an exercise" do
      plan = create(:plan)
      exercises_plan = build(:exercises_plan, exercise: nil, plan: plan)
      expect(exercises_plan).not_to be_valid
      expect(exercises_plan.errors[:exercise]).to include("must exist")
    end

    it "is invalid without a plan" do
      exercise = create(:exercise)
      exercises_plan = build(:exercises_plan, exercise: exercise, plan: nil)
      expect(exercises_plan).not_to be_valid
      expect(exercises_plan.errors[:plan]).to include("must exist")
    end
  end

  describe "associative behavior" do
    it "can associate an exercise with a plan" do
      exercise = create(:exercise)
      plan = create(:plan)

      exercises_plan = create(:exercises_plan, exercise: exercise, plan: plan)

      expect(exercises_plan.exercise).to eq(exercise)
      expect(exercises_plan.plan).to eq(plan)
    end

    it "can retrieve the associated plans from an exercise" do
      exercise = create(:exercise)
      plan1 = create(:plan)
      plan2 = create(:plan)

      create(:exercises_plan, exercise: exercise, plan: plan1)
      create(:exercises_plan, exercise: exercise, plan: plan2)

      expect(exercise.plans).to include(plan1, plan2)
    end

    it "can retrieve the associated exercises from a plan" do
      plan = create(:plan)
      exercise1 = create(:exercise)
      exercise2 = create(:exercise)

      create(:exercises_plan, exercise: exercise1, plan: plan)
      create(:exercises_plan, exercise: exercise2, plan: plan)

      expect(plan.exercises).to include(exercise1, exercise2)
    end
  end
end
