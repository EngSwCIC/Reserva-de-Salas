#paginacao salas steps

Dado("que eu esteja logado como administrador") do
    @admin = User.where(username: 'rootadmin')[0]
    visit new_user_session_path
    fill_in :user_email, with: @admin.email
    fill_in :user_password, with: @admin.password
    click_button "Log in"
end

E("que eu esteja na pagina principal") do
    visit dashboard_path
    expect(page).to have_text("Signed in as... admin@admin.admin")
end

# Happy Path 1
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

# Happy Path 2
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

Dado("que a página {string} existe") do |page|
    expect(get "index", :params => {:page => page}).not_to raise_error(Pagy::Overflow)
end

Quando("eu clico em pagina {string}") do |page|
    click_link (page)
end

Então("eu devo estar na pagina {string}") do |page|
    expect(current_path).to eq("/rooms?page=#{page}")
end

# Sad Path
Dado("que o banco possui até {int} salas") do |qtd|
    @rooms = Room.all
    expect(@rooms.length).to_be <= qtd
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na pagina {string}") do |page|
    expect(current_path).to eq("/rooms?page=#{page}")
end

Quando("eu clico em {string}") do |string|
    click_link (string)
end

Então("eu devo estar na página {string}") do |page|
    expect(current_path).to eq("/rooms?page=#{page}")
end

Quando("eu tento acessar a pagina {string}") do |page|
    visit("/rooms?page=#{page}")
end

Então("devo receber um erro") do
    expect {get "index", :params => {:page => "3"}}.to raise_error(Pagy::OverflowError)
end