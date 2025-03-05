class Admin::UsersController < ApplicationController
  include Authorization
  before_action :authorize_admin
  before_action :set_admin
  before_action :set_client, only: [ :show, :destroy ]

  def index
    @clients = @admin.users
  end

  def show; end

  def new
    @client = User.new
  end

  def create
    @client = User.invite!(user_params) do |u|
      u.role = :user
      u.admin = @admin
    end

    if @client.persisted?
      redirect_to admin_users_path, notice: t("notices.user_invited")
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    if @client.destroy
      redirect_to admin_users_path, notice: t("notices.user_deleted")
    else
      redirect_to admin_users_path, alert: t("alerts.user_delete_failed")
    end
  end

  private
  def set_admin
    @admin = current_user
  end

  def set_client
    @client = @admin.users.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
