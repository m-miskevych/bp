class Client::UserPlansController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    @user_plans = UserPlan.where(user_id: current_user.id)
  end

  def show
    @user_plan = UserPlan.find(params[:id])
  end
end
