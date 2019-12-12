##
# == Definição da classe *AppointmentsController*.
# Responsável pelo controle dos aluguéis: criação, listagem, configuração, atualização e verificação de conflitos. 
#
class AppointmentsController < ApplicationController
  ##
  # Construtor: cria um novo objeto aluguél da classe (_Appointment_) e identifica as salas correspondentes -  transmitidos ao controlador.
  def new
    @appointment = Appointment.new
    @room = Room.find(params[:id])
  end

  ##
  # Configura o novo aluguél criado, atribuindo:
  # * identificadores das salas correspondentes em _room_id_
  # * identificadores do usuário em _user_id_
  # * data do alugél em _appointment_date_
  # * horário de início em _start_time_
  # * 1 (ativo) em _status_
  #
  # Se data e horário de início não forem vazios e o redirecionamento da página ocorrer corretamente, Será noticiado "Aluguel realizado com sucesso!".
  # Caso contrário, será noticiado "Algo deu errado!".
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
      flash[:notice] = "Aluguel realizado com sucesso!"   
    else
      redirect_to backoffice_path
      flash[:danger] = "Algo deu errado!"
    end
      #redirect_to '/'
  end
  
 ##
  # Formata as variáveis de instância para listagem de aluguéis:
  # * _room_ conterá os identificadores das salas correspondentes ao aluguél em questão.
  # * _appointments_ conterá os aluguéis ativos com data a partir do dia atual. 
  # * _dates_ conterá as datas da semana no formato de exemplo: sun (02/Jan) em que o nome da semana e do mês será abreviado e o dia será preenchido de zero.
  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', Date.today.beginning_of_week, params[:id]).all
    @dates = (Date.today.beginning_of_week..Date.today.beginning_of_week+6).map{ |date| date.strftime("%a (%d/%b)") }
  end

  ##
  # Atribui os identificadores das salas correspondentes ao aluguel. 
  def edit
    @appointment = Appointment.find(params[:id])
  end

  ##
  # Método para atualização dos dados do aluguél. 
  # Caso haja atualização, será noticiado "O aluguél foi editado com sucesso!".
  # Caso contrário será noticiado "O aluguél não pôde ser editado! Tente novamente!".  
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

  ##
  # Identifica aluguéis do usuário logado.  
  def my_appointments
    @user = current_user
    @my_appointments = @user.appointments
  end

  ##
  # Identifica todos os aluguéis.
  def all_appointments
    @appointments = Appointment.all

  end

  ##
  # Cancela o aluguél destruindo o objeto correspondente, noticiando "O Aluguel foi cancelado com sucesso".
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:danger] = "O Aluguel foi cancelado com sucesso"
    redirect_to root_path
  end

  ##
  # Identifica os aluguéis que possuem conflitos de data e horário, criando uma lista de listas em que cada aluguel da lista contém uma listas de conflitos.
  # A identificação de conflitos é por meio da comparação das datas e horários entre salas alugadas.  
  def conflicting_appointments
    @appointments = Appointment.all
    @conflicts = Array.new
    @exists = false
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
            @exists = true
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
  ##
  # Cria e permite o recebimento de um parâmetro chamado appointment para os métodos existentes a fim de receber seu status.
  # É permitida somente a existência do atributo status de appointment. 
  def appointment_params#:doc:
    params.require(:appointment).permit(:status)
  end
end
