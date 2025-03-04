class Client::DashboardController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index; end
end
