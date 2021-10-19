Dado("que o banco possui ao menos uma sala cadastrada") do
	if ! Room.exists(name: "teste") then
		@room = Room.create(name: "teste", location: 'locationTeste')
	else
		@room = Room.where(name: "teste")[0]
	end
end

Dado("que o usuário esteja logado como administrador") do
	@user = User.create(username: 'lupas', email: 'lupas@lupas.lupas', password: 'lupasseed', 
        registration: "lupas000", course: "ADMIN", is_admin: true)
    visit new_user_session_path
  	fill_in :user_email, with: @user.email
  	fill_in :user_password, with: @user.password
  	click_button "Log in"
end

Dado('que o usuário esteja na página "Salas Existentes"') do
	visit(rooms_path)
end

Quando("eu clicar no nome da sala") do
	click_link("teste")
end

Então("eu devo ser redirecionado para a página da sala") do
	expect(current_path).to eq(room_path(@room.id))
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