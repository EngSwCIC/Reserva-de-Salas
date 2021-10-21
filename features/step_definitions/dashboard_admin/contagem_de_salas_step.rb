Dado("que eu sou administrador do sistema  com o email {string} e a senha {string}") do |string, string2|
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


Dado('que existam salas com nome {string}, locaização {string} e capacidade da sala {int}') do |string, string2, int|
    @room = Room.new
    @room.name = string1
    @room.students = int
    @room.location = string2
    @room.save
end

Então('aparece um numero {int} mostrando a quantidade de salas no sistema') do |int|
	@rooms = Room.all
	@rooms_qnt = @rooms.length
end

E("eu clicar no botão {string}") do |string|
  click_link (string)
end

Então("eu devo estar em uma página com uma lista contendo a sala {string}, a capacidade {int}, localizada no {string}") do |string,int, string3|
  expect(page).to have_content(string).to be true
  expect(page).to have_content(int).to be true
  expect(page).to have_content(string3).to be true
end

Então('nenhuma sala deve ser mostrada') do 
    expect(page.has_content?).to be true
end





