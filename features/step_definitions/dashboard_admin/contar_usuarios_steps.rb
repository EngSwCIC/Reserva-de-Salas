Dado('que eu sou o administrador do sistema com email {string} senha {string}') do |string, string2|
  User.create(username: 'admin', email: string, password: string2,
    registration: "15015296", course: "CIC", is_admin: true
  )

  visit new_user_session_path

  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

E("que eu esteja na pagina {string}") do |string|
  visit(backoffice_path)
  expect(page).to have_content(string)
end

Dado('que existam vários usuário no sistema') do
  @user1 = User.create(username: "user1", password: "123456", email: "user1@gmail.com", registration: "160149207", course: "CIC", is_admin: false)
  @user2 = User.create(username: "user2", password: "123456", email: "user2@gmail.com", registration: "160149207", course: "CIC", is_admin: false)
  @user3 = User.create(username: "user3", password: "123456", email: "user3@gmail.com", registration: "160149207", course: "CIC", is_admin: false)
end

Quando('eu entrar no dashboard de admin') do
  visit backoffice_path
end

Então('eu devo ver a contagem de todos os usuários') do
  expect(page.has_content?("Nº de Usuários 3")).to be true
end

Dado('que não tenha nenhum usuário no sistema') do
end

Então('nenhum usuário deve ser mostrado') do
  expect(page.has_content?("Nº de Usuários 0")).to be true
end
