# Classe que registra o aluguel de uma sala,
# que pode ser feito por um usuário ou administrador,
# informando obrigatoriamente a data e horário do aluguel
class Appointment < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates_presence_of :start_time
  validates_presence_of :appointment_date


  def self.todays_appointments
    appointment_date = Time.new(Date.today.year, Date.today.month, Date.today.day, 0, 0, 0, "UTC")
    logger.debug appointment_date
    todays_appointments = []

    appointments_for_today = Appointment.where(appointment_date: appointment_date)
    logger.debug appointments_for_today
		# Nas linhas abaixo vou deixar o horário mais bonito		
		appointments_for_today.each do |appointment|
			clean_time = appointment.start_time.strftime("%H:%M")
			todays_appointments << {room_name: Room.find(appointment.room_id).name, time: clean_time, id: appointment.id}			
		end

    return todays_appointments
  end

end
