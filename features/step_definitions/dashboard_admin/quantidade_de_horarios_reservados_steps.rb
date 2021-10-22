#language: pt
#encoding: utf-8

Dado("que eu seja admin do sistema com email {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

Dado('que esteja na página {string}') do |string|
    visit(backoffice_path)
end

Dado('que exista salas com reservas confirmadas') do
    @room = Room.create(name: 'Sala 1', location: 'CIC',  students: 100)
    @appoint_1 = Appointment.create(room_id: @room.id, user_id: User.where(is_admin: true).first.id, description: 'Horario de teste', status: 2)
    @appoint_2 = Appointment.create(room_id: @room.id, user_id: User.where(is_admin: true).first.id, description: 'Horario de teste', status: 1)
end  

Entao('eu devo ver {string}') do |string|
    page.has_content?("#{string}")
end