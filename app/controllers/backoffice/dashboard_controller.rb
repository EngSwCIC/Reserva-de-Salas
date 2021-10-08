class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	def index
		@users = User.all
		@rooms = Room.all
		@appointments = Appointment.all
	end
end