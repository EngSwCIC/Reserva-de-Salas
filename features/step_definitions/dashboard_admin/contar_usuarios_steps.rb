Dado('que eu sou o administrador do sistema com email {string} senha {string}') do |string, string2|
  FactoryBot.create(:user, is_admin: true, email: string, password: string2)

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
  User.create!([
    {
        :username => 'user1',
        :email => 'user1@gmail.com',
        :password => '123456',
        :password_confirmation => '123456',
        :course => 'ENG',
        :is_admin => false,
        :registration => '160149207'
    },
    {
      :username => 'user2',
      :email => 'user2@gmail.com',
      :password => '123456',
      :password_confirmation => '123456',
      :course => 'ENG',
      :is_admin => false,
      :registration => '160149208'
    },
    {
      :username => 'user3',
      :email => 'user3@gmail.com',
      :password => '123456',
      :password_confirmation => '123456',
      :course => 'ENG',
      :is_admin => false,
      :registration => '160149209'
    },
  ])
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
