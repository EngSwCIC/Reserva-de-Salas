class HomeController < ApplicationController
  def index
    @approved = approved_appointments
  end

  def approved_appointments
    Appointment.where(status: 2)
  end

end