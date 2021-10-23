Dado("que eu sou administrador do sistema  com o email {string} e a senha {string}") do |string, string2|
  User.create(username: 'admin', email: string, password: string2,
    registration: "15015296", course: "CIC", is_admin: true
  )
  visit new_user_session_path
  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

Dado("que as salas estejam cadstradas como {string}, {string}, {int}") do |name, location, students|
  @room = Room.create(name: name, location: location, students: students)
end

Quando("tiverem sido criadas três salas no sistema") do |name, location, students|
  @room1 = Room.create(name: name, location: location, students: students)
  @room2 = Room.create(name: name, location: location, students: students)
  @room3 = Room.create(name: name, location: location, students: students)
end

Então("eu devo ver a contagem de 3 salas no backoffice") do
  expect(Room.all).to eq(3)
end









