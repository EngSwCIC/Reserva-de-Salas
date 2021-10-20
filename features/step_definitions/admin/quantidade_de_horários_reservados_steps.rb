Dado("que eu sou administrador do sistema com email {string} senha {string}")do |string, string2|
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

Então("eu devo ver de forma clara um texto {string} informando quantos horários estão resercados no total") do |string|
    expect(page).to have_content(string)
end

Quando("eu clicar em uma semana {string} ou um dia da semana {string}") do |string|
    click_link "#{string}"
end

Então("eu devo ver de forma clara um texto {string} informando quantos horários estão resercados referente a semana ou ao dia em que eu estou") do |string|
    page.has_content?("#{string}")
end