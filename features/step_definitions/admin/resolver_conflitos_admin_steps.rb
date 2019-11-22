# This is the steps file referred to resolver_conflitos_admin feature
# Place your code relative to that feature here

Dado("que eu esteja cadastrado como {string}, {string}, {string}, {string}, {string}") do |email, password, course, registration, username|
  @user = User.create(username: username, password: password, 
  email: email, registration: registration, course: course, is_admin: true)
end

Dado("que eu esteja logado") do
  visit new_user_session_path
  fill_in :user_email, with: @user.email
  fill_in :user_password, with: @user.password
  click_button "Log in"
end

Dado("que eu esteja na página {string}") do |string|
  visit(string)
end


Quando("que eu clico no botao {string}") do |string|
  click_button("#{string}")
end

Então("eu devo ver uma mensagem escrita {string}") do |string|
  page.has_content?("#{string}")
end

Então("eu devo ver link {string}") do |string|
	page.has_link?("#{string}")
end

Quando("eu preencher o campo nome e localidade com:") do |table|
  table.rows_hash.each do |field, value|
  	fill_in field, :with => value
  end
end

Então("eu devo ver listados os dados de {string}, {string}") do |id1, id2|
  page.should have_content(id1)
  page.should have_content(id2)
end

Então("não devo ver listados os dados de {string}, {string}") do |id1, id2|
  page.should have_content(id1)
  page.should have_content(id2)
end

Dado("existam as salas cadastradas no sistema {string}, {string}") do |name, location|
  Room.create(name: name, location: location)
end

Dado("que existem os seguintes alugueis: {string}, {string}")do |appointment_date, start_time|
    @appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = start_time
    @appointment.user_id = User.last.id
    @appointment.room_id = Room.last.id
    @appointment.save
end