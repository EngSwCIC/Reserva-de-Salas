class RoomsAvailableController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', Date.today, params[:id]).all
    @dates = (Date.today..Date.today+6).map{ |date| date.strftime("%a (%d/%b)") }
  end 
end
