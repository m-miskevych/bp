module Authorization
  extend ActiveSupport::Concern

  private
  def authorize_admin
    redirect_to client_dashboard_index_path unless current_user.admin?
  end

  def authorize_client
    redirect_to admin_dashboard_index_path if current_user.admin?
  end
end
