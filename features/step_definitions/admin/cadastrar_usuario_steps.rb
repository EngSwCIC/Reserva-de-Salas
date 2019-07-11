Dado("que existe o usuário {string}, {string}, {string}, {string}, {string}") do |email, password, course, registration, username|
  @user = User.create(username: username, password: password,
  email: email, registration: registration, course: course, is_admin: true)
end

E("que esteja autenticado") do
  visit new_user_session_path
  fill_in :user_email, with: @user.email
  fill_in :user_password, with: @user.password
  click_button "Log in"
end

Dado("que esteja na pagina Backoffice") do
  visit(backoffice_path)
end

Quando("eu clicar em {string}") do |string|
  click_link("#{string}")
end

E("eu esteja agora em uma página com título {string}") do |string|
  page.has_content?("#{string}")
end

Quando("eu preencher formulário com os dados:") do |table|
  table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
end

E("marcar o checkbox de usuário administrador") do
    find(:id, "user_is_admin").set(true)
end

E("clicar no botao {string}") do |string|
  click_button("#{string}")
end

Então("eu devo ser redirecionado para a página Backoffice") do
  expect(current_path).to eq("/backoffice")
end

Então("eu devo permanecer na página de cadastro") do
  expect(current_path).to eq("/signup_user")
end

E("deve haver um alerta de sucesso") do
  expect(page).to have_content("Criado com sucesso!")
end

E("deve haver um alerta de erro de email existente para o email {string}") do |string|
  expect(page).to have_content(string)
end

E("o usuário deve estar cadastrado no banco de dados") do
  created_user = User.where(email: @user.email).first.email
  expect(created_user).to eq(@user.email)
end