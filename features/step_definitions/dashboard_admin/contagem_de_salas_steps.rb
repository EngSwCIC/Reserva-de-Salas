Dado("que eu sou administrador do sistema com email{string} e senha {string}") do |string, string2|
  User.create(username: 'admin', email: string, password: string2,
    registration: "15015296", course: "CIC", is_admin: true
  )

  visit new_user_session_path

  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

Então('eu devo ver a contagem de todas os salas') do
  expect(page.has_content?("Nº de Salas 3")).to be true
end

Dado('que não tenha nenhuma sala no sistema') do

end

Então('nenhuma sala deve ser mostrada') do
  expect(page.has_content?("Nº de Salas 0")).to be true
end

Dado('que existam três salas') do
  Room.create(name: "Sala A", location: "ICC", students: 100)
	Room.create(name: "Sala B", location: "ICC", students: 100)
	Room.create(name: "Sala C", location: "ICC", students: 100)
	expect(Room.all.count).to be == 3
end

