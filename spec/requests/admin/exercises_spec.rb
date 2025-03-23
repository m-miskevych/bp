require 'rails_helper'

RSpec.describe "Admin::ExercisesController", type: :request do
  let(:admin) { create(:user) }
  let(:exercise) { create(:exercise) }

  def sign_in_user(user)
    post user_session_path, params: { user: { email: user.email, password: "password" } }
  end

  before do
    sign_in_user(admin)
  end

  describe "GET /admin/exercises" do
    it "returns http success" do
      get admin_exercises_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/exercises/:id" do
    it "returns http success" do
      get admin_exercise_path(exercise)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/exercises/new" do
    it "returns http success" do
      get new_admin_exercise_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /admin/exercises" do
    context "with valid params" do
      it "creates a new exercise" do
        expect {
          post admin_exercises_path, params: { exercise: {
            name_sk: "Cvičenie 1",
            name_en: "Exercise 1",
            description_sk: "Popis cvičenia 1",
            description_en: "Description of Exercise 1",
            set: 3,
            repetition: 10
          } }
        }.to change(Exercise, :count).by(1)

        expect(response).to redirect_to(admin_exercise_path(Exercise.last))
        expect(flash[:notice]).to eq("Cvičenie bolo úspešne vytvorené.")
      end
    end

    context "with invalid params" do
      it "does not create a new exercise and renders 'new'" do
        expect {
          post admin_exercises_path, params: { exercise: { name_sk: "", name_en: "" } }
        }.to_not change(Exercise, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET /admin/exercises/:id/edit" do
    it "returns http success" do
      get edit_admin_exercise_path(exercise)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /admin/exercises/:id" do
    context "with valid params" do
      it "updates the exercise" do
        patch admin_exercise_path(exercise), params: { exercise: { name_sk: "Updated Exercise" } }
        exercise.reload
        expect(exercise.name_sk).to eq("Updated Exercise")
        expect(response).to redirect_to(admin_exercise_path(exercise))
        expect(flash[:notice]).to eq("Cvičenie bolo úspešne upravené.")
      end
    end

    context "with invalid params" do
      it "does not update the exercise and renders 'edit'" do
        patch admin_exercise_path(exercise), params: { exercise: { set: nil } }
        exercise.reload
        expect(exercise.set).to_not eq(nil)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE /admin/exercises/:id" do
    let!(:exercise) { create(:exercise) }
    context "when exercise is not assigned to a plan" do
      it "deletes the exercise" do
        expect {
          delete admin_exercise_path(exercise)
        }.to change(Exercise, :count).by(-1)
        expect(response).to redirect_to(admin_exercises_path)
        expect(flash[:alert]).to eq("Cvičenie bolo úspešne odstránené.")
      end
    end

    context "when exercise is assigned to a plan" do
      before do
        exercise.plans.create!(name: "Sample Plan", description: "This is a sample plan.")
      end

      it "does not delete the exercise and redirects with alert" do
        expect {
          delete admin_exercise_path(exercise)
        }.to_not change(Exercise, :count)
        expect(response).to redirect_to(admin_exercises_path)
        expect(flash[:alert]).to eq("Toto cvičenie je priradené k plánu a nemôže byť odstránené.")
      end
    end
  end

  describe "DELETE /admin/exercises/:id/remove_image" do
    it "removes the exercise image" do
      exercise.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'hip_flexion1.jpg')), filename: 'hip_flexion1.jpg')
      expect(exercise.images.count).to eq(1)

      delete remove_image_admin_exercise_path(exercise, id: exercise.images.first.id)

      expect(exercise.reload.images.count).to eq(0)
      expect(response).to redirect_to(admin_exercises_path)
      expect(flash[:notice]).to eq("Obrázok bol úspešne odstranený.")
    end
  end
end
