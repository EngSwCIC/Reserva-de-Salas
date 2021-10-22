class Backoffice::DashboardController < BackofficeController
	helper 'backoffice/dashboard'
	#before_action :signed_in?
	#before_action :is_admin?, only: [:new, :create, :destroy]

	def index
		@todays_appointments = Appointment.todays_appointments
		@users = User.all
		@rooms = Room.all
		@appointments = Appointment.all
	end

end