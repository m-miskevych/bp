class Admin::UsersController < ApplicationController
  include Authorization
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
  def set_admin
    @admin = current_user
  end
end
