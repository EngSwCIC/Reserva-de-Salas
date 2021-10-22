# This is the steps file referred to pedidos_pendentes feature
# Place your code relative to that feature here

Dado("que eu seja admin do sistema com email {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: @admin.email
    fill_in :user_password, with: @admin.password
    click_button "Log in"
end

E("que eu esteja na pagina {string}") do |string|
    visit(backoffice_path)
    expect(page).to have_content(string)
 end

E("eu clicar no link {string}") do |string|
    click_link "#{string}"
 end

Quando("eu clicar no link {string}") do |string|
    click_link "#{string}"
end

Então("eu devo estar em uma página com uma lista contendo os pedidos pendentes numero da reserva {int}, localizacao {string}, sala {string}, data {string}, horario da reserva {string}, usuario {string}, capacidade{int} e editar {string}") do |int ,string1, string2, string3, string4, string5, string6|
    expect(page).to have_content(int)
    expect(page).to have_content(string1)
    expect(page).to have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(string4)
    expect(page).to have_content(string5)
    expect(page).to have_content(int)
    expect(page).to have_content(string7) 
end

E("eu clicar em {string}") do |string|
    click_link("#{string}")
  end

Entao("eu posso aceitar a reserva") do |field, value|
   fill_in field, :value
 end 
 
 Quando("eu clicar no link {string}") do |string|
  click_link "#{string}"
end

Entao("que eu esteja na pagina {string}") do |string|
  visit(backoffice_path)
  expect(page).to have_content(string)
end

Então("eu devo ver uma mensagem {string}") do |string|
    page.has_content?("#{string}")
  end