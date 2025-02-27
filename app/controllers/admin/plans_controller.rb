class Admin::PlansController < ApplicationController
  include Authorization
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

    # **Nová akcia na výber klienta pre plán**
    def assign
      @plan = Plan.find(params[:id])
      @clients = User.where(role: :user)  # Zobrazí iba klientov (nie adminov)
    end

    # **Akcia na priradenie plánu vybranému klientovi**
    def assign_plan_to_client
      @plan = Plan.find(params[:id])
      @client = User.find(params[:user_id])

      if @client.plans.include?(@plan)
        flash[:alert] = "Tento klient už má tento plán priradený!"
      else
        @client.plans << @plan
        flash[:notice] = "Plán bol úspešne priradený klientovi."
      end

      redirect_to admin_plans_path
    end

  private
  def plan_params
    params.require(:plan).permit(:name_sk, :name_en, :description_sk, :description_en, exercise_ids: [])
  end
end
