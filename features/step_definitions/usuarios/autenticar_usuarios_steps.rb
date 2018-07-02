Dado("que eu esteja na página principal e já seja um usuário cadastrado") do
  User.create(username: "usuario123", password: "password123", 
    email: "a@a.com", registration: "15015296", course: "CIC", is_admin: false)
  visit("/")
end

E("eu esteja agora em uma página com o título {string}") do |string|
  page.has_content?("#{string}")
end

E("clicar em {string}") do |string|
  click_button(string)
end

Então("eu devo estar em uma página com o título {string}") do |string|
  expect(page).to have_content(string)
end
