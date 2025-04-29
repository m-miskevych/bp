class Client::AppointmentsController < ApplicationController
  include Authorization
  before_action :authorize_client
  before_action :set_session_slot, only: [ :new ]

  def index
    all = current_user.appointments_as_client.includes(:session_slot).order(:start_at)
    @rejected_appointments = all.select { |a| a.rejected? }
    valid_appointments = all.reject { |a| a.rejected? }
    @upcoming_appointments = valid_appointments.select { |a| a.start_at.future? }
    @past_appointments     = valid_appointments.select { |a| a.start_at.past? }
  end

  def new
    @appointment = Appointment.new(
      session_slot: @session_slot,
      start_at: @session_slot.available_at,
      end_at: @session_slot.available_at + @session_slot.duration.minutes
    )
  end

  def create
    @appointment = current_user.appointments_as_client.new(appointment_params)

    if @appointment.save
      AppointmentMailer.new_request(@appointment).deliver_later
      redirect_to client_session_slots_path, notice: t("notices.appointment_created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = current_user.appointments_as_client.find(params[:id])
    @appointment.destroy
    redirect_to client_appointments_path, notice: t("notices.appointment_canceled")
  end

  private

  def set_session_slot
    @session_slot = SessionSlot.find(params[:session_slot_id])
  end

  def appointment_params
    params.require(:appointment).permit(:session_slot_id, :start_at, :end_at, :notes)
  end
end
