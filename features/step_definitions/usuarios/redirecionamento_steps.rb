# cenario feliz
Dado("que o usuário acabou de efetuar o login") do
    @user = User.create(username: "teste_redirecionamento", email: "teste_redirecionamento@email.com", password: "teste_redirecionamento", registration: "teste_redirecionamento000", course: "cic", is_admin: false)

    visit new_user_session_path
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: @user.password
    click_button "Log in"
end

Então("ele deve ser redirecionado à página de backoffice") do
    expect(current_path).to eq(backoffice_path)
end

Então("consegue ter acesso aos recursos desejados, como a listagem de salas.") do
    page.has_content? "Salas Existentes"
end

# cenario triste
Dado("que o usuário efetuou o login utilizando credenciais inválidas") do
    @user = User.create(username: "teste_redirecionamento", email: "teste_redirecionamento@email.com", password: "teste_redirecionamento", registration: "teste_redirecionamento000", course: "cic", is_admin: false)

    visit new_user_session_path
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: "senha_incorreta"
    click_button "Log in"
end

Então("ele deve permanecer na página de login") do
    expect(current_path).to eq(new_user_session_path)
end

Então("deve ser avisado de que as credenciais são inválidas.") do
    page.has_content? "Invalid Email or password."
end
