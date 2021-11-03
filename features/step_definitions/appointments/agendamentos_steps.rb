require 'date'

Dado("que o banco possui ao menos uma sala cadastrada") do
	if ! Room.exists?(name: "teste") then
		@room = Room.create(name: "teste", location: "locationTeste", students: 20)
	else
		@room = Room.where(name: "teste")[0]
	end
end

Dado("que o usuário esteja logado como administrador") do
	if ! User.exists?(username: 'lupas3') then
		@user = User.create(username: 'lupas3', email: 'lupas3@lupas3.lupas3', password: 'lupas3seed', registration: "lupas3000", course: "ADMIN", is_admin: true)
	else
		@user = User.where(username: 'lupas3')[0]
	end

    visit new_user_session_path
  	fill_in :user_email, with: @user.email
  	fill_in :user_password, with: "lupas3seed"
  	click_button "Log in"
end

Dado('que o usuário esteja na página "Salas Existentes"') do
	visit(rooms_path)
end

Quando("eu clicar no nome da sala") do
	click_link(@room.name)
end

Então("eu devo ser redirecionado para a página da sala") do
	expect(current_path).to eq(room_path(@room.id))
end

# Esse passo já foi implementado pelo cadastrar_usuario_steps
# Quando("eu clicar em "Agendamentos"") do
# 	click_link("Agendamentos")
# end

# Esse passo já foi implementado pelo cadastrar_usuario_steps
# Quando("eu clicar em "Histórico"") do
# 	click_link("Histórico")
# end

Dado("que a sala possua um agendamento às {string} horas para daqui a {string} dias a contar do dia de hoje") do |hora, offset|
	@appointment = Appointment.create(:room_id => @room.id, :appointment_date => "#{Date.today + offset.to_i}", :start_time => hora + ":00:00", :user_id => @user.id)
	
	if (defined? @appointment_list).nil? then
		@appointment_list = Array.new
	end

	@appointment_list = @appointment_list.append(@appointment)
end

Dado("que a sala possua um agendamento às {string} horas há {string} dias") do |hora, offset|
	@appointment = Appointment.create(:room_id => @room.id, :appointment_date => "#{Date.today - offset.to_i}", :start_time => hora + ":00:00", :user_id => @user.id)

	if (defined? @appointment_list).nil? then
		@appointment_list = Array.new
	end

	@appointment_list = @appointment_list.append(@appointment)
end

Então("eu devo ver uma lista que contenha esses dois agendamentos") do
	expect(page).to have_content("#{(@appointment_list[0].appointment_date).strftime("%d/%m/%Y")}" + ' ' + "#{(@appointment_list[0].start_time).strftime("%T")}")
	expect(page).to have_content("#{(@appointment_list[1].appointment_date).strftime("%d/%m/%Y")}" + ' ' + "#{(@appointment_list[1].start_time).strftime("%T")}")

	@appointment_list = []
end


Quando("eu manualmente digitar a URL no navegador para acessar a página de uma sala") do
	@room_path = room_path("X")
end

Quando("não existir um registro correspondente a URL") do
	visit(@room_path)
end

Então('eu devo ser redirecionado para página "Salas Existentes" e informado do erro.') do
	expect(current_path).to eq(rooms_path)
	expect(page).to have_content("A sala procurada não existe!")
end