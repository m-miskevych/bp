class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to current_user.admin? ? admin_dashboard_index_path : client_dashboard_index_path
    end
  end
end
