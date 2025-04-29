class Client::SessionSlotsController < ApplicationController
  include Authorization
  before_action :authorize_client

  def index
    reserved_ids = Appointment.where(status: [ :approved, :pending ]).pluck(:session_slot_id)

    if current_user.admin
      @session_slots = current_user.admin.session_slots
        .where.not(id: reserved_ids)
        .where("available_at >= ?", Time.current)
        .order(:available_at)
    else
      @session_slots = []
    end
  end
end
