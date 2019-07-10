Dado("que eu sou administrador do sistema com email {string} senha {string}")do |string, string2|
    User.create(username: 'admin', email: string, password: string2, 
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

Dado("eu esteja na página de {string}") do |string|
    expect(current_path).to eq("/#{string}")
end

Dado("e exista um usuário com {string}, curso {string}, email {string}, registro {string}") do |string1, string2, string3, int|
    table.rows_hash.each do |field, value|
        @user = User.new
        @user.username = string1 
        @user.course = string2
        @user.email = string3
        @user.registration = int
        @user.save
    end
end

Quando("eu escrever na barra de pesquisa o nome {string} e clicar no botão {string}")do |string1, string2|
    click_link (string2)
end

Então("eu devo ver uma tabela com o nome {string} e seus respectivos dados") do |string, table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
end

Então("eu devo estar em uma página com uma lista contendo o usuario {string}, email {string}, curso {string}, e registro {int}") do |string1 ,string2, string3, int|
    expect(page).to have_content(string1)
    expect(page).to have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(int)
end