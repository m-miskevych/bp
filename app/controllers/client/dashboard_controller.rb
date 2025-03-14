class Client::DashboardController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    @user_plans_draft = current_user.user_plans.draft
    @user_plans_in_progress = current_user.user_plans.in_progress
  end
end
