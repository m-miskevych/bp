class Client::PlansController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    @plans = current_user.plans
  end
end
