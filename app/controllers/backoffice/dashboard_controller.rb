require 'date'

class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	def index
		todays_appointments = Appointment.where(appointment_date: Date.today)
		# Deixar o horário mais bonito
		@todays_appointments = Hash.new
		# todays_appointments.each do |appointment|
		# 	clean_time = appointment.start_time.to_s(:time)  
		# 	@todays_appointments << {room_name: appointment.room.name, time: clean_time}
			
		# end
			
	end
end