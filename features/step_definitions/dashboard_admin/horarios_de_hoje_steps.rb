Dado('que eu tenha aprovado uma reserva de um usuário no Hoje e horario {int}:{int}') do |hora, minuto|
    room = Room.create(name: 'Sala 1', location: 'CIC',  students: 100)
    require 'date'
    today = Date.today
    start_time = Time.new(today.year, today.month, today.day, hora, minuto, 0, "+03:00")
    appointment = Appointment.create(room_id: room.id, user_id: User.first, appointment_date: today, start_time: start_time, description: 'Horario de teste', status: 2)       
end

Então('eu devo ver {int}:{int} na tabela de horários') do |hora, minuto|    
    expect(page.has_content?("#{hora}:#{minuto}")).to be true
end

Então('devo ver {string}') do |string|
    expect(page.has_content?("#{string}")).to be true
end