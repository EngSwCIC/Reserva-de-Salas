# coding: utf-8

##
# Módulo com funções auxiliares para manipular salas disponiveis.
module RoomsAvailableHelper
	##
  # Retorna um array com appointments futuros de determinada sala.
  # Caso não exista retorna nill
  def get_future_appointments(id)
    Appointment.where('appointment_date >= ? AND room_id = ?', Date.today, id).all
  end

  ##
  # Retorna um array com strings das datas no formato (DiadaSemana (Dia/Mes)) de hoje até daqui 1 mês.
  def get_future_dates
    (Date.today..Date.today>>1).map{ |date| date.strftime("%a (%d/%b)") }
  end

  ##
  # Retorna um hash com chaves do array recebido 'keys' e com o conteudo definido por 'item'
  def build_hash(keys, item)
    Hash[keys.collect { |date| [date, item.dup]}]
  end

  ##
  # Retorna um array com os horarios disponiveis
  # Retira horário do hash do dia em questão caso o horário não esteja disponível.
  def available_times(times, app)
    if ( (app.status == 2) and (times.include?(app.start_time.strftime("%H:%M"))) )
    	times.delete(app.start_time.strftime ("%H:%M"))
    end
    return times
  end

  ##
  # Retorna um hash com chaves como sendo os dias no periodo de 1 mes a partir do dia de hoje, no formato (DiadaSemana (Dia/Mes)),
  # e com seus valores sendo os horarios disponiveis para reserva em cada dia na sala de id 'room_id'
  def get_hash_available_times
    dates = get_future_dates
    options_start = ["06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00"]
    build_hash(dates, options_start)
  end
end
