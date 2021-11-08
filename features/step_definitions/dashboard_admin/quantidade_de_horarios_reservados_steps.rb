#language: pt
#encoding: utf-8

Dado('que esteja na página {string}') do |string|
    visit(backoffice_path)
end

Dado('que exista salas com reservas confirmadas') do
    @room = Room.create(name: 'Sala 1', location: 'CIC',  students: 100)
    [2,1].each do |status_code|
        Appointment.create(room_id: @room.id, user_id: User.where(is_admin: true).first.id, description: 'Horario de teste', status: status_code)   
    end
end  

Entao('eu devo ver {string}') do |string|
    page.has_content?("#{string}")
end