require 'rails_helper'

RSpec.describe Exercise, type: :model do
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

    it 'has one image attached' do
      exercise = create(:exercise)
      exercise.images.attach(io: File.open('spec/fixtures/images/hip_flexion1.jpg'), filename: 'hip_flexion1.jpg')

      expect(exercise.images.count).to eq(1)
    end

    it 'has many images attached' do
      exercise = create(:exercise)
      exercise.images.attach(io: File.open('spec/fixtures/images/hip_flexion1.jpg'), filename: 'hip_flexion1.jpg')
      exercise.images.attach(io: File.open('spec/fixtures/images/hip_flexion1.jpg'), filename: 'hip_flexion1.jpg')

      expect(exercise.images.count).to eq(2)
      expect(exercise.images.first).to be_an_instance_of(ActiveStorage::Attachment)
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

  describe 'validations' do
    it 'is invalid without a name' do
      exercise = Exercise.new(description: 'Test description', set: 3, repetition: 10)
      expect(exercise).not_to be_valid
      expect(exercise.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      exercise = Exercise.new(name: 'Test Exercise', set: 3, repetition: 10)
      expect(exercise).not_to be_valid
      expect(exercise.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a set' do
      exercise = Exercise.new(name: 'Test Exercise', description: 'Test description', repetition: 10, set: nil)
      expect(exercise).not_to be_valid
      expect(exercise.errors[:set]).to include("can't be blank")
    end

    it 'is invalid without a repetition' do
      exercise = Exercise.new(name: 'Test Exercise', description: 'Test description', set: 3, repetition: nil)
      expect(exercise).not_to be_valid
      expect(exercise.errors[:repetition]).to include("can't be blank")
    end

    it 'is invalid with a non-integer set' do
      exercise = Exercise.new(name: 'Test Exercise', description: 'Test description', set: 'abc', repetition: 10)
      expect(exercise).not_to be_valid
      expect(exercise.errors[:set]).to include('is not a number')
    end

    it 'is invalid with a non-integer repetition' do
      exercise = Exercise.new(name: 'Test Exercise', description: 'Test description', set: 3, repetition: 'abc')
      expect(exercise).not_to be_valid
      expect(exercise.errors[:repetition]).to include('is not a number')
    end

    it 'is invalid without a valid youtube_url' do
      exercise = Exercise.new(name: 'Test Exercise', description: 'Test description', set: 3, repetition: 10, video_url: 'invalid_url')
      expect(exercise).not_to be_valid
      expect(exercise.errors[:video_url]).to include('must be a valid YouTube link (e.g., https://www.youtube.com/watch?v=ID or https://youtu.be/ID)')
    end
  end

  describe 'translations' do
    let(:exercise) { Exercise.create!(name: 'Squat', description: 'A basic leg exercise', set: 3, repetition: 10) }

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

  describe 'methods' do
    it 'correctly generates youtube embed url' do
      exercise = create(:exercise, video_url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ')
      expect(exercise.youtube_embed_url).to eq('https://www.youtube.com/embed/dQw4w9WgXcQ')
    end

    it 'returns nil if youtube_url is empty' do
      exercise = create(:exercise, video_url: nil)
      expect(exercise.youtube_embed_url).to be_nil
    end
  end
end
