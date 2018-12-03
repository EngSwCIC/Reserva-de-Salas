# This is the steps file referred to editar_salas feature
# Place your code relative to that feature here
Dado("que eu esteja na página principal e já seja um administrador cadastrado e já exista uma sala cadastrada") do
    User.create!(username: 'admin', email: 'admin@admin.admin', password: 'adminseed', 
        registration: "admin000", course: "ADMIN", is_admin: true)
    Room.create!(name: 'SalaTeste', location: 'locationTeste', tipo_sala: 'tipoTeste')
    visit("/")
  end
  
Quando("eu esteja agora em uma página com o título {string},") do |string|
    expect(page).to have_content(string)
end

Então("deve haver um botão na tela com a opção de {string} pois estarei vendo as salas do sistema") do |string|
    expect(page).to have_content(string)
end

Então("eu devo estar na página de visualização de sala") do
    room = Room.where(name: "SalaTeste").first.id
    expect(current_path).to eq("/rooms/" + room.to_s)
end

Então("minha sala deve estar com os campos atualizados como {string}") do |string|
    edited_room = Room.where(name: "SalaTeste").first.name
    expect(edited_room).to eq(string)
end