##
# Class responsável por armazenar todos os métodos relacionados a dashboard do admin
class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	# Controller que lista todas as informações necessárias para a dashboard do admin
	# Assim ele é responsável por informar o número de usuários, salas, pedidos de reserva totais, pedidos de reserva de salas pendentes e horários reservados para o dia atual do sistema
	def index
		##
		# Variável de instância @rooms recebe todas as salas contidas no banco de dados do sistema
		@todays_appointments = Appointment.todays_appointments
		@users = User.where(is_admin: false)
		@rooms = Room.all
		@appointments = Appointment.all
		@appointments_aprove = Appointment.where(status: 2)
	end

end