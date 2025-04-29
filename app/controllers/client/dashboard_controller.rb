class Client::DashboardController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    @user_plans_draft = current_user.user_plans.draft
    @user_plans_in_progress = current_user.user_plans.in_progress

    @next_appointment = current_user.appointments_as_client
    .includes(:session_slot)
    .where("start_at >= ?", Time.current)
    .order(:start_at)
    .first
  end
end
