class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	def index
		@users = User.all
		@rooms = Room.all
		@appointments = Appointment.all
		@appointments_aprove = Appointment.where(status: 2)
	end
end