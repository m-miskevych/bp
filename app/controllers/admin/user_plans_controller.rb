class Admin::UserPlansController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def show
    @user_plan = UserPlan.find_by(user_id: params[:user_id], plan_id: params[:plan_id])

    if @user_plan.nil?
      # Handle the case where the UserPlan doesn't exist
      redirect_to admin_user_plans_path, alert: "User plan not found"
    end
  end
end
