#paginacao salas steps

Dado("que eu esteja logado como administrador com o email {string} e a senha {string}") do |string, string2|
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

E("que eu quero esteja logado") do
    visit dashboard_path
    expect(page).to have_text("Signed in as... admin@admin.admin")
end

E("que eu quero acessar a lista das salas existentes") do
    expect(current_path).to eq("/backoffice")
end

Dado("que o banco possui até {int} salas") do |qtd|
    @rooms = Room.all
    expect(@rooms.length).to_be <= qtd
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na pagina {string}") do |string|
    expect(current_path).to eq("#{string}")
end

Dado("que o banco possui até {int} salas") do |qtd|
    @rooms = Room.all
    expect(@rooms.length).to_be <= qtd
end

Dado("que a página {string} existe") do |page|
    expect(get "index", :params => {:page => page}).not_to raise_error(Pagy::Overflow)
end

Quando("eu clico em página {int}") do |page|
    click_link (page)
end

Então("eu devo estar na página {int}") do |page|
    expect(current_path).to eq("/users/show?page=#{string}")
end