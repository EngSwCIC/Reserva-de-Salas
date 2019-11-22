class TodayAppointmentsController < ApplicationController
  def index
    @day = Date.parse(DateTime.now.strftime("%y/%m/%d"))
    @appointments_today = Appointment.where(:appointment_date => @day.beginning_of_day .. @day.end_of_day)
  end
end
