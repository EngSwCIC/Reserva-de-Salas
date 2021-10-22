Dado("que eu esteja logado como usuário comum com o email {string} e a senha {string}") do |string, string2|
  User.create(username: 'usuario123', email: string, password: string2,
  registration: "15015296", course: "CIC", is_admin: false
  )
  visit new_user_session_path
  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

Dado("que eu esteja cadastrado como usuario {string}, {string}, {string}, {string}, {string}") do |email, password, course, registration, username|
  @user = User.create(username: username, password: password,
  email: email, registration: registration, course: course, is_admin: false)
end

Dado("exista a sala {string}, {string}, {string} cadastrada no sistema") do |name, students, location|
  @room = Room.where(name: name, students: students, location: location).first_or_create
end

Então("eu devo estar em uma página com uma tabela com os dados:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_content(value)
  end
end

Dado("eu esteja no página principal com caminho {string}") do |string|
  expect(current_path).to eq("#{string}")
end

E("que esteja na pagina inicial") do
  visit(root_path)
end