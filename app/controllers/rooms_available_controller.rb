##
# == Definição da classe *RoomsAvailableController*.
# Responsável por identificar salas/horários disponíveis para aluguel.
# === Métodos:
# * _show_.


class RoomsAvailableController < ApplicationController
  ##
  # Identifica salas/horários disponíveis para aluguel.
  # Primeiramente, identifica alugueis atuais (cujas datas não são anteriores ao dia atual).
  # Em seguida cria um Hash, para cada data do mês a partir do dia atual, com os vetor de horários disponíveis:
  # ["06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00"]
  #
  # Em seguida, para cada aluguel ativo, deleta no Hash o horário do dia correspondente.
  # Dessa forma, o Hash possuirá apenas horários disponíveis em datas válidas.
  def show
    @room = Room.find(params[:id])
    @appointments = Appointment.where('appointment_date >= ? AND room_id = ?', Date.today, params[:id]).all
    @dates = (Date.today..Date.today>>1).map{ |date| date.strftime("%a (%d/%b)") }
    options_start = ["06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00"]
    @available = Hash[@dates.collect { |date| [date, options_start.dup]}]
    @appointments.each do |app|
    	date_now = app.appointment_date.strftime("%a (%d/%b)")
    	if ( (app.status == 2) and (@available[date_now].include?(app.start_time.strftime("%H:%M"))) )
    		@available[date_now].delete(app.start_time.strftime ("%H:%M"))
    	end
    end
  end 
end
