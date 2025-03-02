class Client::PlansController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    @plans = current_user.plans
  end

  def show
    @plan = current_user.plans.find(params[:id])
  end
end
