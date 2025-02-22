class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_admin

  def index
    @clients = @admin.users
  end

  # Zobrazenie detailov konkrétneho klienta
  def show
    @client = @admin.users.find(params[:id])
  end

  private
  def authorize_admin
    redirect_to client_dashboard_index_path unless current_user.admin?
  end

  def set_admin
    @admin = current_user
  end
end
