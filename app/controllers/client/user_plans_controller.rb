class Client::UserPlansController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    @user_plans = UserPlan.where(user_id: current_user.id)
  end

  def show
    @user_plan = UserPlan.find(params[:id])
    @comments = @user_plan.comments.order(created_at: :desc)
  end
end
