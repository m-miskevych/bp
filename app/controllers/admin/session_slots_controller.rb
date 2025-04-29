class Admin::SessionSlotsController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def index
    @session_slots = current_user.session_slots
      .where("available_at >= ?", Time.current)
      .order(:available_at)
  end


  def new
    @session_slot = current_user.session_slots.build
  end

  def create
    @session_slot = current_user.session_slots.build(session_slot_params)
    if @session_slot.save
      redirect_to admin_session_slots_path, notice: t("notices.session_slot_created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def session_slot_params
    params.require(:session_slot).permit(:name, :location, :description, :duration, :available_at)
  end
end
