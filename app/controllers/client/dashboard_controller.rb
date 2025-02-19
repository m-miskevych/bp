class Client::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_client

  def index
  end

  private

  def authorize_client
    redirect_to admin_dashboard_index_path if current_user.admin?
  end
end
