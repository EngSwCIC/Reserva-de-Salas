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

Dado("existam as seguintes salas cadastradas no sistema:") do |table|
  table.rows_hash.each do |field, value|
    @room = Room.new
    @room.name = value
    @room.location = value
    @room.save
  end
end

Quando("eu clicar no botão {string}") do |string|
  click_button string
end

Então("eu devo estar em uma página com uma tabela com os dados:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_content(value)
  end
end


Então("eu devo estar em uma página com uma lista contendo a sala {string} localizada no {string}") do |string, string2|
  expect(page).to have_content(string)
end
