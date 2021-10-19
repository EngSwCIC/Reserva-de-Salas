Dado("que o banco possui ao menos uma sala cadastrada") do
	@room = Room.create(name: "teste#{Time.now.utc}", location: 'locationTeste')
end


Dado("que o usuário esteja logado como administrador") do
	@user = User.create(username: 'lupas', email: 'lupas@lupas.lupas', password: 'lupasseed', 
        registration: "lupas000", course: "ADMIN", is_admin: true)
    visit new_user_session_path
  	fill_in :user_email, with: @user.email
  	fill_in :user_password, with: @user.password
  	click_button "Log in"
end

Dado('que a sala possua ao menos um agendamento') do
	@appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = '8:00:00'
    @appointment.user_id = @user.id
    @appointment.room_id = @room.id
    @appointment.save

    @appointment = Appointment.new
    @appointment.appointment_date = Date.today - 7
    @appointment.start_time = '6:00:00'
    @appointment.user_id = @user.id
    @appointment.room_id = @room.id
    @appointment.save
end

Dado('que o usuário esteja na página "Salas Existentes"') do
	visit('/rooms')
end

Quando("eu clicar no nome da sala") do
	visit("/rooms/#{@room.id}")
end

Quando("eu clicar em {str}") do |str|
	if str == "Agendamentos" then
		visit("/rooms/#{@room.id}?filter=appointments")
	else
		visit("/rooms/#{@room.id}?filter=history")
	end
end

Então("eu devo ver a lista com todos os agendamentos atuais da sala em questão") do
	expect(page).to have_content('8:00:00')
	expect(page).to have_content("#{Date.today + 1}")
end

Então('eu devo ver a lista com todos os agendamentos passados da sala em questão') do
	expect(page).to have_content('6:00:00')
	expect(page).to have_content("#{Date.today - 7}")
end

Quando("eu manualmente digitar a URL no navegador para acessar a página de uma sala") do
	visit("/rooms/#{Date.today}")
end

Quando("não existir um registro correspondente a URL") do
	print()
end

Então("eu devo ser redirecionado para uma página que informe ao usuário que a sala em questão não existe.") do
	expect(page).to
end