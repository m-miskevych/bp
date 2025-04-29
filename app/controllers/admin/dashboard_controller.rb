class Admin::DashboardController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def index
    @total_exercises = Exercise.count
    @total_plans = Plan.count
    @total_clients = current_user.users.count

    @upcoming_appointments = Appointment
    .joins(:session_slot)
    .where(session_slots: { physiotherapist_id: current_user.id }, status: :approved)
    .where("start_at >= ?", Time.current)
    .includes(:client, :session_slot)
    .order(:start_at)
    .limit(3)
  end
end
