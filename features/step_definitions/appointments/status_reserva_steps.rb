Quando("eu clicar no botão {string} para a requisição da sala {string} no horário de {string} da manhã") do |string, string2, string3|
    # printf("\n\nBODY = #{page.html}\n\n")
    # printf("\n\nBODY = #{page.body}\n\n")
    within("#table") do
        within(".appointment-data") do
            click_link_or_button(string)
        end
    end
end

Dado("que exista a sala {string}, {string} na data {string}") do |sala, hora, data|

end

Dado("que a data e horário atual sejam após {string}") do |string|
    expect(Time.now).to be > string.to_datetime
end

Dado("que exista a sala {string}, {string}, {string} cadastrada no sistema") do |sala, hora, data|
  expect(page).to have_content(sala)
  expect(page).to have_content(hora)
  expect(page).to have_content(data)
end

Dado("que a sala {string}, {string}, {string} não possua requisições no horário de {string} da manhã") do |name, students, location, horario|
  @appointment = Appointment.new
  @appointment.appointment_date = Date.today + 1
  @appointment.start_time = horario
  @appointment.user_id = User.id
  @appointment.room_id = Room.where(name: name, students: students, location: location).id
  @appointment.save
end

Dado("que a sala {string}, {string}, {string} possua requisições no horário de {string} da manhã") do |name, students, location, horario|
   # Write code here that turns the phrase above into concrete actions
end

Dado("a sala {string} possua uma requisição aprovada no horário de {string}") do |sala, horario|
  @appointment = Appointment.new
  @appointment.appointment_date = Date.today + 1
  @appointment.start_time = horario
  @appointment.user_id = User.last.id
  @appointment.room_id = Room.where(name: sala).last.id
  @appointment.save
end

Dado("a sala {string} nao possua requisições no horário de {string}") do |sala, horario|
  @appointment = Appointment.new
  @appointment.appointment_date = Date.today + 1
  @appointment.start_time = horario
  @appointment.user_id = User.id
  @appointment.room_id = Room.where(name: sala).id
  @appointment.save
end
