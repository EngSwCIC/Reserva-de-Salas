# coding: utf-8

Dado("existam os seguintes alugueis confirmados cadastrados no meu nome: {string}, {string}") do |string, string2|
    @appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = start_time
    @appointment.user_id = User.last.id
    @appointment.room_id = Room.last.id
    @appointment.status = 2
    @appointment.save
end

Dado("existam os seguintes alugueis rejeitados cadastrados no meu nome: {string}, {string}") do |string, string2|
    @appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = start_time
    @appointment.user_id = User.last.id
    @appointment.room_id = Room.last.id
    @appointment.status = 3
    @appointment.save
end
