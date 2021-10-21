E ('meu usuário admin é válido') do
    expect(User.where(is_admin: true).length).to be > 0
end

Dado('que eu tenha aprovado uma reserva de um usuário para hoje no horario {int}:{int}') do |hora, minuto|
    room = Room.create(name: 'Sala 1', location: 'CIC',  students: 100)
    require 'date'
    today = Date.today
    today_date = Time.new(today.year, today.month, today.day, 0, 0, 0, "UTC")
    start_time = Time.new(2000, 1, 1, hora, minuto, 0, "UTC")
    appointment = Appointment.create(room_id: room.id, user_id: User.where(is_admin: true).first.id, appointment_date: today_date, start_time: start_time, description: 'Horario de teste', status: 2)
    appointment.save!
    expect(Appointment.all.length).to eq 1
end

Então('eu devo ver {int}:{int} na tabela de horários') do |hora, minuto|    
    expect(page.has_content?("#{hora}:#{minuto}")).to be true
end

Então('devo ver {string}') do |string|
    expect(page.has_content?("#{string}")).to be true
end