Quando("eu clicar no link {string} próximo ao nome da sala") do |string|
  first('.room-item').click_link("#{string}")
end

Quando("preencher o dia do alugel com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
    fill_in field, :with => Date.today + 1
  end
end


Quando("selecionar o seguinte horário de {string} da manhã") do |string|
  select string, from: "start_time"
end

Quando("preencher o campo descrição com {string}") do |string|
  fill_in 'description', with: string
end

Então("deve aparecer uma mensagem na tela dizendo {string}") do |string|
  expect(page).to have_content(string)
end

E("eu esteja na página principal") do
  visit("/")
end

Quando('clicar na célula verde correspondente ao horário de {string} de segunda-feira') do |horario|
  dia = (Date.today.beginning_of_week..Date.today.beginning_of_week+6).first.strftime("%Y-%m-%d")
  hora = /\d+/.match(horario)
  click_button('Reservar', { :title => "#{hora}_#{dia}" })
end

Quando('clicar na célula vermelha correspondente ao horário de {string} de segunda-feira') do |horario|
  dia = (Date.today.beginning_of_week..Date.today.beginning_of_week+6).first.strftime("%Y-%m-%d")
  hora = /\d+/.match(horario)
  click_button('Indisponível', { :title => "#{hora}_#{dia}" })
end

Então('deve aparecer uma modal na tela com a sala {string} e o horário de {string} de segunda-feira') do |nome, horario|
  within('#reservaModal') do
    expect(page).to have_content(horario)
    expect(page).to have_content(nome)
    # expect(page).to have_field('start_time_disabled', disabled: true, with: horario)
  end
end

E('clicar no botão Reservar') do
  within('#reservaModal') do
    click_button('Reservar')
  end
end