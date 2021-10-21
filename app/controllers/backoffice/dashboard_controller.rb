require 'date'

class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	def index

		@todays_appointments = Appointment.todays_appointments
		@users = User.all
		@rooms = Room.all
		@appointments = Appointment.all

	end
end