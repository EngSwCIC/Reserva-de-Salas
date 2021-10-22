Dado("que eu sou administrador do sistema com email {string} senha {string}")do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: @admin.email
    fill_in :user_password, with: @admin.password
    click_button "Log in"
end

Dado("eu esteja na página de Lista de usuários") do
    visit(users_show_path)
end

Dado("que exista um usuário com nome {string}, curso {string}, email {string}, registro {string}") do |username, course, email, registration|
    @user = User.create(username: username, password: 'senha12345',
        email: email, registration: registration, course: course, is_admin: false)
end

Quando("eu escrever no campo {string} o nome {string}") do |string1, string2|
    fill_in(string1, :with => string2)
end

E("clicar no botão de busca {string}") do |string|
    click_button string
end

Então("eu devo ver uma tabela com o nome {string} e seus respectivos dados:") do |string, table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
end

Então("não deve haver resultados da busca") do
    expect(page).to have_css('table#table tbody tr', :count=>0)
end


E("não devo ver o usuário {string}") do |string|
    expect(page).not_to have_content(string)
end

Então("eu devo estar em uma página com uma lista contendo o usuario {string}, email {string}, curso {string}, e registro {int}") do |string1 ,string2, string3, int|
    expect(page).to have_content(string1)
    expect(page).to have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(int)
end