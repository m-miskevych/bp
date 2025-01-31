class PlansController < ApplicationController
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
      redirect_to plan_url(@plan)
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
      redirect_to plan_url(@plan)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_url
  end

  def plan_params
    params.require(:plan).permit(:name_sk, :name_en, :description_sk, :description_en, exercise_ids: [])
  end
end
