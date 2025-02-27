class Admin::ExercisesController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def index
    @exercises = Exercise.i18n.order(:name)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to admin_exercise_url(@exercise), notice: "Exercise created successfully."
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to admin_exercise_url(@exercise)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    if @exercise.exercises_plans.any?
      redirect_to admin_exercises_url, alert: "This exercise is assigned to a plan and cannot be deleted."
    else
      @exercise.destroy
      redirect_to admin_exercises_url, alert: "Exercise deleted successfully."
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to admin_exercises_url
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name_sk, :name_en, :description_sk, :description_en, :set, :repetition, images: [])
  end
end
