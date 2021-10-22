# paginacao usuarios steps

Dado("que eu esteja logado como administrador") do
    @admin = User.where(username: 'rootadmin')[0]
    visit new_user_session_path
    fill_in :user_email, with: @admin.email
    fill_in :user_password, with: @admin.password
    click_button "Log in"
end

E("que eu esteja na página principal") do
    visit dashboard_path
    expect(page).to have_text("Signed in as... admin@admin.admin")
end

# Happy Path 1
Dado("que o banco possui até {int} usuários") do |qtd|
    @users = User.all
    expect(@users.length).to_be <= qtd
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na página {string}") do |string|
    expect(current_path).to eq("#{string}")
end

# Happy Path 2
Dado("que o banco possui até {int} usuários") do |qtd|
    @users = User.all
    expect(@users.length).to_be <= qtd
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na página {string}") do |string|
    expect(current_path).to eq("#{string}")
end

Dado("que a página {string} existe") do |page|
    expect {get "show", :params => {:page => page}}.not_to raise_error(Pagy::OverflowError)
end

Quando("eu clico em página {string}") do |page|
    click_link (page)
end

Então("eu devo estar na página {string}") do |page|
    expect(current_path).to eq("/users/show?page=#{page}")
end

# Sad Path

Dado("que o banco possui até {int} usuários") do |qtd|
    @users = User.all
    expect(@users.length).to_be <= qtd
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na página {string}") do |page|
    expect(current_path).to eq("/users/show?page=#{page}")
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na página {string}") do |page|
    expect(current_path).to eq("/users/show?page=#{page}")
end

Quando("eu tento acessar a página {string}") do |page|
    visit("/users/show?page=#{page}")
end

Então("devo receber um erro") do
    expect {get "index", :params => {:page => "3"}}.to raise_error(Pagy::OverflowError)
end








Dado("que eu esteja logado como administrador com o email {string} e a senha {string}") do |string, string2|
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

E("que eu esteja logado") do
    visit dashboard_path
    expect(page).to have_text("Signed in as... admin@admin.admin")
end

E("que eu quero acessar a lista dos usuarios existentes") do
    expect(current_path).to eq("/backoffice")
end

Dado("que o banco possui até {int} usuarios") do |qtd|
    @users = User.all
    expect(@users.length).to_be <= qtd
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na pagina {string}") do |string|
    expect(current_path).to eq("#{string}")
end

Dado("que o banco possui {int} usuarios") do |qtd|
    @users = User.all
    expect(@users.length).to_be <= qtd
end

Dado("que a página {string} existe") do |page|
    expect(get "show", :params => {:page => page}).not_to raise_error(Pagy::Overflow)
end

Quando("eu clico em página {int}") do |page|
    click_link (page)
end

Então("eu devo estar na página {int}") do |page|
    expect(current_path).to eq("/rooms?page=#{string}")
end