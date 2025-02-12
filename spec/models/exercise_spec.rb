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
