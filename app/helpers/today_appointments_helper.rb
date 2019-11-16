module TodayAppointmentsHelper
  def get_room(id)
    Room.find(id)
  end

  def get_user(id)
    User.find(id)
  end
end
