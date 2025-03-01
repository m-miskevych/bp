class Admin::UsersController < ApplicationController
  include Authorization
  before_action :authorize_admin
  before_action :set_admin

  def index
    @clients = @admin.users
  end

  def show
    @client = @admin.users.find(params[:id])
  end

  def new
    @client = User.new
  end

  def create
    @client = User.new(user_params)
    @client.role = :user  # set role as client
    @client.admin = @admin  # assign to current admin
    @client.password = SecureRandom.hex(10) # set temporery password for user ????

    if @client.save
      redirect_to admin_users_path, notice: t("notices.user_created")
    else
      render "new", status: :unprocessable_entity
    end
  end

  private
  def set_admin
    @admin = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
