Quando("eu clicar no botão {string} nessa mesma página") do |string|
  click_link(string)
end

Quando("eu esteja em uma página com o título {string}") do |string|
  expect(page).to have_content(string)
end

Então("eu devo estar novamente na página inicial de perfil") do
  expect(current_path).to eq("/")
end

E("meu usuário deve estar com os campos atualizados como {string}") do |string|
  created_user = User.where(email: "novo_email@a.com").first.email
  expect(created_user).to eq(string)
end

