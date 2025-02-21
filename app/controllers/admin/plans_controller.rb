class Admin::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to admin_plan_url(@plan)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to admin_plan_url(@plan)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to admin_plans_url
  end

  private
  def plan_params
    params.require(:plan).permit(:name_sk, :name_en, :description_sk, :description_en, exercise_ids: [])
  end

  def authorize_admin
    redirect_to client_dashboard_index_path unless current_user.admin?
  end
end
