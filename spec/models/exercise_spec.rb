require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe 'validations' do
    it 'is invalid without a name' do
      exercise = Exercise.new(description: 'Test description')
      expect(exercise).not_to be_valid
      expect(exercise.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      exercise = Exercise.new(name: 'Test Exercise')
      expect(exercise).not_to be_valid
      expect(exercise.errors[:description]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'can be associated with multiple plans' do
      exercise = create(:exercise)
      plan1 = create(:plan)
      plan2 = create(:plan)
      create(:exercises_plan, exercise: exercise, plan: plan1)
      create(:exercises_plan, exercise: exercise, plan: plan2)

      expect(exercise.plans).to include(plan1, plan2)
    end

    it 'has no plans initially' do
      exercise = create(:exercise)
      expect(exercise.plans).to be_empty
    end

    it 'can be destroyed' do
      exercise = create(:exercise)
      expect { exercise.destroy }.to change(Exercise, :count).by(-1)
    end

    it "does not destroy the exercise when the associated plan is destroyed" do
      plan1 = create(:plan)
      exercise = create(:exercise)
      create(:exercises_plan, exercise: exercise, plan: plan1)

      expect(Exercise.count).to eq(1)

      plan1.destroy

      expect(Exercise.count).to eq(1)
      expect(Exercise.find(exercise.id)).to eq(exercise)

      expect(exercise.plans).to be_empty
    end
  end

  describe 'translations' do
    let(:exercise) { Exercise.create!(name: 'Squat', description: 'A basic leg exercise') }

    before do
      Mobility.with_locale(:en) do
        exercise.update!(name: 'Squat', description: 'A basic leg exercise')
      end
      Mobility.with_locale(:sk) do
        exercise.update!(name: 'Drep', description: 'Základné cvičenie na nohy')
      end
    end

    it 'returns the correct translation for name' do
      Mobility.with_locale(:sk) do
        expect(exercise.name).to eq('Drep')
      end
      Mobility.with_locale(:en) do
        expect(exercise.name).to eq('Squat')
      end
    end

    it 'returns the correct translation for description' do
      Mobility.with_locale(:sk) do
        expect(exercise.description).to eq('Základné cvičenie na nohy')
      end
      Mobility.with_locale(:en) do
        expect(exercise.description).to eq('A basic leg exercise')
      end
    end
  end
end
