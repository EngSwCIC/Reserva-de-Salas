E ('meu usuário admin é válido') do
  expect(User.where(is_admin: true).length).to be > 0
end

Dado('que o usuário já tenha feito um pedido de sala') do
  room = Room.create(name: 'Sala 1', location: 'CIC',  students: 100)
  require 'date'
  today = Date.today
  today_date = Time.new(today.year, today.month, today.day, 0, 0, 0, "UTC")
  start_time = Time.new(2000, 1, 1, 10, 0, 0, "UTC")
  appointment = Appointment.create(room_id: room.id, user_id: User.where(is_admin: true).first.id, appointment_date: today_date, start_time: start_time, description: 'Horario de teste', status: 1)
  appointment.save!
  expect(Appointment.where(status: 1).length).to eq 1
end

Entao('eu devo ver a quantidade de pedidos pendentes') do
  expect(Appointment.where(status: 1).length).to eq 1
  expect(page.has_content?("Nº Pedidos Pendentes 1")).to be true
end

Dado('que eu esteja na página {string}') do |string|
  visit(backoffice_path)
  expect(page).to have_content(string)
end

Entao('eu devo ver nenhum numero de pedidos pendentes') do
  expect(page.has_content?("Nº Pedidos Pendentes 0")).to be true
end

