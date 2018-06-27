# This is the steps file referred to index_for_appointments feature
# Place your code relative to that feature here
Dado("existam as salas cadastradas no sistema: {string}, {string}") do |name, location|
  Room.create(name: name, location: location)
end

Dado("existam os seguintes alugueis cadastrados no meu nome: {string}, {string}")do |appointment_date, start_time|
    @appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = start_time
    @appointment.user_id = User.last.id
    @appointment.room_id = Room.last.id
    @appointment.save
end

Então("eu devo estar em uma página com uma tabela com os dados {string}, {string}") do |appointment_date, start_time|
  page.should have_content(Date.today + 1)
  page.should have_content(start_time)
end
