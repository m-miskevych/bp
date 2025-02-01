class DashboardController < ApplicationController
  def index
    @total_exercises = Exercise.count
    @total_plans = Plan.count
  end
end
