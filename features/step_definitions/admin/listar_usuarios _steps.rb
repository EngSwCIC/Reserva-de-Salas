# This is the steps file referred to listar_usuarios feature
# Place your code relative to that feature here

Dado("que eu esteja logado como administrador com o email {string} e a senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2, 
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Usuários"
end

Dado("eu esteja no {string}") do |string|
    expect(current_path).to eq("/#{string}")
end

Dado("existe um usuário com nome {string}, {string}, {string}, {string} cadastrado no sistema") do |string1, string2, string3, string4|
    table.rows_hash.each do |field, value|
        @user = User.new
        @user.username = string1 
        @user.course = string2
        @user.email = string3
        @user.registration = string4
        @user.save
    end
end

Quando("eu clicar no botão {string}") do |string|
    click_link (string)
end

Então("eu devo estar em uma página com uma tabela com os dados:") do |table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
end

Então("eu devo estar em uma página com uma lista contendo o usuario {string}, email {string}, curso {string}, e registro {string}") do |string1 ,string2, string3, string4|
    expect(page).to have_content(string1)
    expect(page).to have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(string4)
end


