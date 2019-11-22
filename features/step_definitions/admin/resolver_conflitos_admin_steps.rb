# This is the steps file referred to resolver_conflitos_admin feature
# Place your code relative to that feature here

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

Então("eu devo ver listados os dados de {string}, {string}, {string}") do |id, data, hora|
  page.has_content?(id)
  page.has_content?(data)
  page.has_content?(hora)
end

Então("não devo ver listados os dados de {string}, {string}, {string}") do |id, data, hora|
  page.has_no_text?(id)
  page.has_no_text?(data)
  page.has_no_text?(hora)
end

Dado("existam as salas cadastradas no sistema {string}, {string}") do |name, location|
  Room.create(name: name, location: location)
end

Dado("que existem os seguintes alugueis: {string}, {string}")do |appointment_date, start_time|
    @appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = start_time
    @appointment.room_id = Room.last.id
    @appointment.user_id = User.last.id
    @appointment.status = 1
    @appointment.save
end