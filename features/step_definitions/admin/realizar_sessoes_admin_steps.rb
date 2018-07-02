Dado("que eu esteja na página principal e já seja um usuário cadastrado como {string}, {string}, {string}, {string}, {string}") do |email, password, course, registration, username|
  visit(root_path)
  @user = User.create(username: username, password: password, 
  email: email, registration: registration, course: course, is_admin: true)
end

Dado("eu clicar no link para inicio de sessao {string}") do |login|
  click_link "#{login}"
end

Quando("eu preencher o campo email e password com:") do |table|
  table.rows_hash.each do |field, value|
  	fill_in field, :with => value
  end
end

Quando("eu clicar no botão para iniciar sessao {string}") do |string|
  click_button("#{string}")
end

Entao("eu devo ser redirecionado para a pagina {string}") do |string|
  expect(current_path).to eq("/#{string}")
end