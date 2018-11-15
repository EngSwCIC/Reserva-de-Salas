Dado("que eu esteja logado como usuário com o email {string} e a senha {string}") do |string, string2|
  User.create(username: 'Andre Luis', email: string, password: string2, 
  registration: "150017171", course: "CIC", is_admin: false
  )
  visit new_user_session_path
  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

E("eu esteja no página principal do sistema com caminho {string}") do |string|
  expect(current_path).to eq(string)
end

E("existam tais salas cadastradas no sistema: {string}, {string}") do |name, location|
  Room.create(name: name, location: location)
end

Quando("eu selecionar a opção {string}") do |string|
  click_link("#{string}")
end

E("eu selecionar o link {string} próximo ao nome da sala") do |string|
  first('.room-item').click_link("#{string}")
end

E("preencher o dia do aluguel com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
    fill_in field, :with => Date.today + 1
  end
end

E("selecionar tal horário de {string} da manhã") do |string|
  select string, from: "start_time"
end

Então("após o pedido ser analisado pelo administrador do sistema eu devo receber em meu email {string}") do |string|
    # Recebimento do email confirmando ou nao a tentativa de reserva 
end


  
  