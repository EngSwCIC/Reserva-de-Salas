Dado("que eu esteja na página principal") do
  visit("/")
end

Quando("eu preencher o formulário com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
end

E("clicar no botão {string}") do |string|
  click_button("#{string}")
end

Então("eu devo ser redirecionado para a página inicial") do
  expect(current_path).to eq("/")
end

E("deve haver um botão na tela com a opção de {string} pois eu já estarei logado no sistema") do |string|
  expect(page).to have_content(string)
end
