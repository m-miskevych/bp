class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @total_exercises = Exercise.count
    @total_plans = Plan.count
    @total_clients = current_user.users.count
  end

  private
  def authorize_admin
    redirect_to client_dashboard_index_path unless current_user.admin?
  end
end
