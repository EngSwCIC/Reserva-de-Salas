##
# A classe AppointmentsController é responsável por
# realizar a comunicação entre as requisições do usuário
# e a Model de Appointment de modo a realizar as operações
# desejadas

class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  ##
  # POST /appointments
  # registra o aluguel de uma sala, feito pelo usuário autenticado e
  # contendo obrigatoriamente a data e horário do aluguel.
  # O método redireciona o usuário para a tela de backoffice e
  # cria a sala no banco de dados.
  def create
    room_id = params[:format]
    appointment_date = params[:appointment_date]
    start_time = params[:start_time]

    @appointment = Appointment.new(
                                    :room_id => room_id,
                                    :user_id => current_user.id,
                                    :appointment_date => appointment_date,
                                    :start_time => start_time,
                                    :description => params[:description],
                                    :status => 1
                                  )
    redirect_to backoffice_path
    if (appointment_date.size > 0) and (start_time.size > 0) and @appointment.save
      flash[:notice] = "Sala reservada com sucesso!"
    else
      flash[:danger] = "Algo deu errado!"
    end
  end

  ##
  # GET /appointments/:id
  # O método é responsável por exibir os agendamentos específicos de uma sala ao usuário.
  # O único parâmetro necessário é o id da sala.
  # O método retorna os agendamento encontrados, as datas e a sala daquele agendamento.
  def show
    beginning_date = Date.today.beginning_of_week
    room_id = params[:id]
    @room = Room.find(room_id)
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', beginning_date, room_id).all
    @dates = (beginning_date..beginning_date+6)
  end

  ##
  # GET /appointments/:id/edit
  # O método é responsável por retornar o formulário de edição de um agendamento
  # O único parâmetro necessário é o id do agendamento
  # O método retorna o formulário de edição do agendamento encontrado.
  def edit
    @appointment = Appointment.find(params[:id])
  end

  ##
  # PATCH ou PUT /appointments/:id
  # O método é responsável por atualizar um agendamento com novas informações.
  # São necessários as informações atuais do agendamento e o seu id.
  # O método atualiza no banco de dados e redireciona para a listagem de agendamentos.
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
  # GET /my-appointments
  # O método é responsável por mostrar os agendamentos de um certo usuário
  # O método retorna os agendamentos encontrados.
  def my_appointments
    @user = current_user
    @my_appointments = @user.appointments
  end

  ##
  # GET /all-appointments
  # O método é responsável por mostrar todos os agendamentos.
  # O método retorna os agendamentos encontrados.
  def all_appointments
    @appointments = Appointment.all
  end

  ##
  # DELETE /appointments/:id
  # O método é responsável por deletar um certo agendamento.
  # O único parâmetro necessário é o id do agendamento a ser deletado.
  # O método destroi o agendamento no banco de dados e redireciona o usuário
  # para a página inicial
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:danger] = "O Aluguel foi cancelado com suceso"
    redirect_to root_path
  end

  private

  # def appointment_params
  # O método define os parâmetros aceitos de um agendamento.
  def appointment_params
    params.require(:appointment).permit(:status)
  end
end