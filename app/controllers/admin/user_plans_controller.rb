class Admin::UserPlansController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def show
    @user_plan = UserPlan.find_by(user_id: params[:user_id], plan_id: params[:plan_id])
    if @user_plan.nil?
      # Handles the case where the UserPlan doesn't exist
      redirect_to admin_plans_url, alert: t("alerts.plan_not_found")
      return
    end
    @comments = @user_plan.comments.order(created_at: :desc)
  end
end
