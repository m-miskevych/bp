class AppointmentMailer < ApplicationMailer
  def approved(appointment)
    @appointment = appointment
    @client = appointment.client
    @slot = appointment.session_slot

    I18n.with_locale(I18n.locale) do
      mail(
        to: @client.email,
        subject: t("mailers.appointment_mailer.approved.subject")
      )
    end
  end

  def rejected(appointment)
    @appointment = appointment
    @client = appointment.client
    @slot = appointment.session_slot

    I18n.with_locale(I18n.locale) do
      mail(
        to: @client.email,
        subject: t("mailers.appointment_mailer.rejected.subject")
      )
    end
  end

  def new_request(appointment)
    @appointment = appointment
    @client = appointment.client
    @physio = appointment.session_slot.physiotherapist

    I18n.with_locale(I18n.locale) do
      mail(
        to: @physio.email,
        subject: t("mailers.appointment_mailer.new_request.subject")
      )
    end
  end
end
