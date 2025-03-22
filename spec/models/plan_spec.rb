require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:plan) { create(:plan) }

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

    it "destroys associated user_plans when the plan is destroyed" do
      plan = create(:plan)
      user = create(:user)
      create(:user_plan, plan: plan, user: user)

      expect(UserPlan.count).to eq(1)

      plan.destroy

      expect(UserPlan.count).to eq(0)
    end
  end

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

  describe 'translations' do
    let(:plan) { Plan.create!(name: 'Exercise Plan', description: 'A plan for exercises') }

    before do
      Mobility.with_locale(:en) do
        plan.update!(name: 'Exercise Plan', description: 'A plan for exercises')
      end
      Mobility.with_locale(:sk) do
        plan.update!(name: 'Plán Cvičení', description: 'Plán pre cvičenia')
      end
    end

    it 'returns the correct translation for name' do
      Mobility.with_locale(:sk) do
        expect(plan.name).to eq('Plán Cvičení')
      end
      Mobility.with_locale(:en) do
        expect(plan.name).to eq('Exercise Plan')
      end
    end

    it 'returns the correct translation for description' do
      Mobility.with_locale(:sk) do
        expect(plan.description).to eq('Plán pre cvičenia')
      end
      Mobility.with_locale(:en) do
        expect(plan.description).to eq('A plan for exercises')
      end
    end
  end
end
