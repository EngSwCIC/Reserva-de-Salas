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
  expect(page).to have_content('')
  expect(page).to have_content('')
end