class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #

  # Send password reset emails
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Recuperação de senha"
  end

  # Send status notification of appointments emails 
  def status_notification(appointment)
    @appointment = appointment
    @user = appointment.user
    mail to: @user.email, subject: "Status da sua reserva"
  end
end
