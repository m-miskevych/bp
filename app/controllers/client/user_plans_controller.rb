class Client::UserPlansController < ApplicationController
  include Authorization
  before_action :authorize_client
  before_action :set_user_plan, only: [ :show, :start, :complete ]

  def index
    @user_plans = UserPlan.where(user_id: current_user.id)
  end

  def show
    @user_plan = UserPlan.find(params[:id])
    @comments = @user_plan.comments.order(created_at: :desc)
  end

  def start
    if @user_plan.draft?
      @user_plan.update(status: :in_progress)
      flash[:notice] = t("notices.plan_started")
    else
      flash[:alert] = t("alerts.plan_cannot_be_started")
    end
    # redirect_to user_plan_path(@user_plan)
    redirect_to client_user_plan_path(@user_plan)
  end

  def complete
    if @user_plan.in_progress?
      @user_plan.update(status: :done)
      flash[:notice] = t("notices.plan_completed")
    else
      flash[:alert] = t("alerts.plan_is_not_active")
    end
    # redirect_to user_plan_path(@user_plan)
    redirect_to client_user_plan_path(@user_plan)
  end

  private
  def set_user_plan
    # only current user plans
    @user_plan = current_user.user_plans.find_by(id: params[:id])

    unless @user_plan
      flash[:alert] = t("alerts.plan_not_found")
      render file: Rails.root.join("public/404.html"), status: :not_found, layout: false
    end
  end
end
