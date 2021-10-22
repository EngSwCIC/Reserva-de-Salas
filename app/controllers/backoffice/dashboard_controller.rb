class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	def index

		@todays_appointments = Appointment.todays_appointments
		@users = User.where(is_admin: false)
		@rooms = Room.all
		@appointments = Appointment.all

	end
end