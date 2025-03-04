class Admin::ExercisesController < ApplicationController
  include Authorization
  before_action :authorize_admin
  before_action :set_exercise, only: [ :show, :edit, :update, :destroy ]

  def index
    @exercises = Exercise.i18n.order(:name)
  end

  def show; end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to admin_exercise_url(@exercise), notice: t("notices.exercise_created")
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @exercise.update(exercise_params)
      redirect_to admin_exercise_url(@exercise), notice: t("notices.exercise_updated")
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    if @exercise.exercises_plans.any?
      redirect_to admin_exercises_url, alert: t("alerts.exercise_assigned_to_plan")
    else
      @exercise.destroy!
      redirect_to admin_exercises_url, alert: t("notices.exercise_deleted")
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to admin_exercises_url, notice: t("notices.image_removed")
  end

  private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name_sk, :name_en, :description_sk, :description_en, :set, :repetition, images: [])
  end
end
