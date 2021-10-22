class HomeController < ApplicationController
  def index
    @approved = approved_appointments
    @expired = expired_appointments
  end

  def approved_appointments
    Appointment.where(status: 2).order('appointment_date ASC')
  end

  def expired_appointments
    Appointment.where("appointment_date < ?", Date.today)
  end
end