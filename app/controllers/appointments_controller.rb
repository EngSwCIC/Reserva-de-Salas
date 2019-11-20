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
      redirect_to backoffice_path
      flash[:notice] = "Alguel realizado com sucesso!"   
    else
      redirect_to backoffice_path
      flash[:danger] = "Algo deu errado!"
    end
      #redirect_to '/'
  end

  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', Date.today.beginning_of_week, params[:id]).all
    @dates = (Date.today.beginning_of_week..Date.today.beginning_of_week+6).map{ |date| date.strftime("%a (%d/%b)") }
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to all_appointments_path
      flash.now[:notice] = "O aluguél foi editado com sucesso!"
    else
      flash.now[:danger] = "O aluguél não pôde ser editado! Tente novamente!"
      render 'edit'
    end
  end

  def my_appointments
    @user = current_user
    @my_appointments = @user.appointments
  end

  def all_appointments
    @appointments = Appointment.all

  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:danger] = "O Aluguel foi cancelado com sucesso"
    redirect_to root_path
  end

  def conflicting_appointments
    @appointments = Appointment.all
    @conflicts = Array.new
    @appointments.each do |appointment|
      conflicting = false
      if(@conflicts[0])
        @conflicts.each do |conflict|
          if ((conflict[0].start_time == appointment.start_time) and
            (conflict[0].appointment_date == appointment.appointment_date) and
            (conflict[0].room_id == appointment.room_id) and
            (appointment.status != 3)and 
            (conflict[0].status == appointment.status))
            conflicting = true
            conflict << appointment;
          end
        end
      end
      if !conflicting
        @conflicts.push(Array.new(1,appointment))
      end
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:status)
  end
end