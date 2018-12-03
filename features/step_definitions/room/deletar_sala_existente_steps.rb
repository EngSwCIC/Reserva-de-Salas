# This is the steps file referred to deletar_sala_existente feature
# Place your code relative to that feature here

Dado("que eu esteja cadastrado e logado como administrador do sistema") do
  	@user = User.create!(username: 'admin', email: 'admin@admin.admin', password: 'adminseed', 
        registration: "admin000", course: "ADMIN", is_admin: true)
    visit new_user_session_path
  	fill_in :user_email, with: @user.email
  	fill_in :user_password, with: @user.password
  	click_button "Log in"
end

Dado("já exista uma sala cadastrada no sistema") do
  Room.create!(name: 'teste', location: 'locationTeste', tipo_sala: 'tipoTeste')
end

Dado("eu esteja na pagina backoffice") do
  visit(backoffice_path)
end

Dado("eu clique no link {string}") do |string|
  click_link("#{string}")
end

Quando("eu clicar no botao {string}") do |string|
  click_link("#{string}")
end


Então("eu devo ver uma mensagem {string}") do |string|
  page.has_content?("#{string}")
end