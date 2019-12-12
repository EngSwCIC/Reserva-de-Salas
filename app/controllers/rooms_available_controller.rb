##
# == Definição da classe *RoomsAvailableController*.
# Responsável por identificar salas/horários disponíveis para aluguel.
# === Métodos:
# * _show_.


class RoomsAvailableController < ApplicationController
  ##
  # Identifica salas/horários disponíveis para aluguel.
  # Salas disponíveis são aquelas sem consulta ou que a consulta não foi confirmada.
  # Primeiramente, identifica alugueis atuais (cujas datas não são anteriores ao dia atual).
  # Em seguida cria um Hash, para cada data do mês a partir do dia atual, com os vetor de horários disponíveis:
  #
  # |"06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00"|
  #
  # Em seguida, para cada aluguel ativo, deleta no Hash o horário do dia correspondente.
  # Dessa forma, o Hash possuirá apenas horários disponíveis em datas válidas.
  def show
    @room = Room.find(params[:id])
    @appointments = helpers.get_future_appointments(params[:id])
    @available = helpers.get_hash_available_times
    @appointments.each do |app|
    	date_now = app.appointment_date.strftime("%a (%d/%b)")
    	@available[date_now] = helpers.available_times(@available[date_now], app)
    end
  end 
end
