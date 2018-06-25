class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @room = Room.find(params[:id])
  end

  def create
    room_id = params[:format]
    @appointment = Appointment.new
    @appointment.room_id = params[:format]
    @appointment.user_id = current_user.id
    @appointment.appointment_date = params[:appointment_date]
    @appointment.start_time = params[:start_time]
    @appointment.status = 1
    if (params[:appointment_date].size > 0) and (params[:start_time].size > 0) and @appointment.save
      redirect_to request.referrer
      flash[:notice] = "Alguel realizado com sucesso!"   
    else
      redirect_to request.referrer
      flash[:danger] = "Algo deu errado!"
    end
      #redirect_to '/'
  end

  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', Date.today.beginning_of_week, params[:id]).all
    @dates = (Date.today.beginning_of_week..Date.today.beginning_of_week+6).map{ |date| date.strftime("%a (%d/%b)") }
  end

  def my_appointments
    @user = current_user
    @my_appointments = @user.appointments
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:danger] = "O Aluguel foi cancelado com suceso"
    redirect_to root_path
  end

  private
end