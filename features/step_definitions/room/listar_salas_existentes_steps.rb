Dado("que eu esteja logado como usuário comum com o email {string} e a senha {string}") do |string, string2|
  User.create(username: 'usuario123', email: string, password: string2, 
  registration: "15015296", course: "CIC", is_admin: false
  )
  visit new_user_session_path
  fill_in :user_email, with: string
  fill_in :user_password, with: string2
  click_button "Log in"
end

Dado("eu esteja no página principal com caminho {string}") do |string|
  expect(current_path).to eq("#{string}")
end
