# This is the steps file referred to criar_sala feature
# Place your code relative to that feature here

Dado("que eu esteja cadastrado como {string}, {string}, {string}, {string}, {string}") do |email, password, course, registration, username|
  @user = User.create(username: username, password: password, 
  email: email, registration: registration, course: course, is_admin: true)
end

Dado("que esteja logado") do
  visit new_user_session_path
  fill_in :user_email, with: @user.email
  fill_in :user_password, with: @user.password
  click_button "Log in"
end

Dado("que esteja na pagina {string}") do |string|
  visit(backoffice_path)
end

Dado("eu clicar no link {string}") do |string|
  click_link "Adicionar Sala"
end

Quando("eu preencher o campo nome e localidade com:") do |table|
  table.rows_hash.each do |field, value|
  	fill_in field, :with => value
  end
end

Quando("clicar no botao {string}") do |string|
  click_button("#{string}")
end

Então("eu devo ver uma mensagem escrita {string}") do |string|
  page.has_content?("#{string}")
end

