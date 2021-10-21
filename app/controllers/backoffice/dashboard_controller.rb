class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'

	def index
		@todays_appointments = Appointment.todays_appointments
	end
end