class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @room = Room.find(params[:id])
  end

  ##
  # POST /appointments
  # registra o aluguel de uma sala, feito pelo usuário autenticado e
  # contendo obrigatoriamente a data e horário do aluguel.
  # O motivo (description) é opcional.
  def create
    room_id = params[:format]
    @appointment = Appointment.new
    @appointment.room_id = params[:format]
    @appointment.user_id = current_user.id
    @appointment.appointment_date = params[:appointment_date]
    @appointment.start_time = params[:start_time]
    @appointment.description = params[:description]
    @appointment.status = 1
    if (params[:appointment_date].size > 0) and (params[:start_time].size > 0) and @appointment.save
      redirect_to backoffice_path
      flash[:notice] = "Alguel realizado com sucesso!"
    else
      redirect_to backoffice_path
      flash[:danger] = "Algo deu errado!"
    end
  end

  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', Date.today.beginning_of_week, params[:id]).all
    @dates = (Date.today.beginning_of_week..Date.today.beginning_of_week+6).map{ |date| date.strftime("%a (%d/%b)") }
  end

  def status
    # Atualiza o status e salva
    @appointment = Appointment.find(params[:id])
    @appointment.status = params[:status]
    @appointment.save

    # TODO: fazer ajax funcionar?
    # Redireciona para a propria pagina
    respond_to do |format|
      format.html { redirect_to all_appointments_path }
    end
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
    flash[:danger] = "O Aluguel foi cancelado com suceso"
    redirect_to root_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:status)
  end
end