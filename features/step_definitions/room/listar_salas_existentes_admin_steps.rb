Dado("que eu esteja logado como administrador com o email {string} e a senha {string}") do |string, string2|
  User.create(username: 'admin', email: string, password: string2,
    registration: "15015296", course: "CIC", is_admin: true
  )
  visit new_user_session_path
  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

Dado("eu esteja no {string}") do |string|
  expect(current_path).to eq("/#{string}")
end

Dado("existam as salas {string}, {int}, {string} cadastradas no sistema:") do |string1, int, string2|
    @room = Room.new
    @room.name = string1
    @room.students = int
    @room.location = string2
    @room.save
end

Quando("eu clicar no botão {string}") do |string|
  click_link (string)
end

Então("eu devo estar em uma página com uma lista contendo a sala {string}, a capacidade {int}, localizada no {string}") do |string,int, string3|
  expect(page).to have_content(string)
  expect(page).to have_content(int)
  expect(page).to have_content(string3)
end
