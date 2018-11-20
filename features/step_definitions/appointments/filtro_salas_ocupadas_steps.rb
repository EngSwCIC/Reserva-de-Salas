Dado("existam alugueis para a semana cadastrados no sistema na sala {string}, {string}")do |name, location|
  @appointment = Appointment.new
  @appointment.appointment_date = Date.today
  @appointment.start_time = '08:00:00'
  @appointment.user_id = User.last.id
  @appointment.room_id = Room.where(name: name, location: location)
  @appointment.save
end

Então("eu devo estar em uma página com uma tabela listando a sala {string}, {string}") do |name, location|
  page.should have_content(name)
  page.should have_content(location)
end