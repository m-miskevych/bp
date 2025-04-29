class Admin::AppointmentsController < ApplicationController
  include Authorization
  before_action :authorize_admin

  def index
    all = Appointment
      .joins(:session_slot)
      .where(session_slots: { physiotherapist_id: current_user.id })
      .includes(:client, :session_slot)
      .order(:start_at)

    @upcoming_appointments = all.select { |a| a.start_at.future? }
    @past_appointments     = all.select { |a| a.start_at.past? }
  end


  def update
    @appointment = Appointment
      .joins(:session_slot)
      .where(session_slots: { physiotherapist_id: current_user.id })
      .find(params[:id])

    if @appointment.update(status: params[:status])
      case @appointment.status
      when "approved"
        AppointmentMailer.approved(@appointment).deliver_later
      when "rejected"
        AppointmentMailer.rejected(@appointment).deliver_later
      end

      redirect_to admin_appointments_path, notice: t("notices.appointment_status_updated")
    else
      redirect_to admin_appointments_path, alert: t("alerts.appointment_status_update_failed")
    end
  end
end
