class RoomsAvailableController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ? AND appointment_date <= ?', Date.today, params[:id], Date.today>>1).all
    @dates = (Date.today..Date.today>>1).map{ |date| date.strftime("%a (%d/%b)") }
    options_start = ["06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00"]
    @available = Hash[@dates.collect { |date| [date, options_start]}]
    @appointments.each do |app|
    	date_now = app.appointment_date.strftime("%a (%d/%b)")
    	if ( (app.status == 2) and (@available[date_now].include?(app.start_time.strftime("%H:%M"))) )
    		#@available[date_now].delete(app.start_time.strftime ("%H:%M"))
    		@available[date_now].delete("06:00")
    	end
    end
  end 
end
