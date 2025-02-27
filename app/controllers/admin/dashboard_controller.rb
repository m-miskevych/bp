class Admin::DashboardController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def index
    @total_exercises = Exercise.count
    @total_plans = Plan.count
    @total_clients = current_user.users.count
  end
end
