# This is the steps file referred to listar_usuarios feature
# Place your code relative to that feature here

Dado("que eu seja admin do sistema com email {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

E("que eu esteja na pagina backoffice") do
    visit(backoffice_path)
end

Então("eu devo ver uma tabela com os dados:") do |table|
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

Então("o primeiro usuario deve ser {string} e o segundo {string}") do | string1, string2 |
    expect(page.find('#table > tbody > tr:nth-child(1) > td:nth-child(1)').text).to match(string1)
    expect(page.find('#table > tbody > tr:nth-child(2) > td:nth-child(1)').text).to match(string2)
end

Quando("clicar na coluna {string}") do |string|
  click_link string
end

