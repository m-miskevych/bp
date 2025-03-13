class Admin::PlansController < ApplicationController
  include Authorization
  before_action :authorize_admin
  before_action :set_plan, only: %i[show edit update destroy assign assign_plan_to_client remove_plan_from_client]
  before_action :set_client, only: %i[assign_plan_to_client remove_plan_from_client]

  def index
    @plans = Plan.all
    @users = current_user.users
    # @user_plans = UserPlan.includes(:user, :plan).order("users.name ASC")
    @user_plans = UserPlan.includes(:user, :plan).joins(:user, :plan)
  end

  def show; end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to admin_plan_url(@plan), notice: t("notices.plan_created")
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to admin_plan_url(@plan), notice: t("notices.plan_updated")
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy!
    redirect_to admin_plans_url, alert: t("alerts.plan_deleted")
  end

  def assign
    @clients = current_user.users # clients for current admin
  end

  def assign_plan_to_client
    if @client.plans.include?(@plan)
      flash[:alert] = t("alerts.plan_already_assigned")
    else
      @client.plans << @plan
      flash[:notice] = t("notices.plan_assigned")
    end
    redirect_back_or_to admin_plans_url
  end

  def remove_plan_from_client
    if @client.plans.include?(@plan)
      @client.plans.destroy(@plan)
      flash[:notice] = t("notices.plan_removed")
    else
      flash[:alert] = t("alerts.plan_not_assigned")
    end
    redirect_to admin_user_path(@client)
  end

  private
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_client
    @client = User.find(params[:user_id])
  end

  def plan_params
    params.require(:plan).permit(:name_sk, :name_en, :description_sk, :description_en, exercise_ids: [])
  end
end
