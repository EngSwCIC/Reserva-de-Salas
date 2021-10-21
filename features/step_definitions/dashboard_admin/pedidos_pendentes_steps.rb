# This is the steps file referred to pedidos_pendentes feature
# Place your code relative to that feature here

Dado("que eu seja admin do sistema com email {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
        registration: "15015296", course: "CIC", is_admin: true
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
end

E("que eu esteja na pagina backoffice") do
    visit(backoffice_path)
end

E("eu clicar no link {string}") do |string|
    click_link "#{string}"
  end


Então("eu devo estar em uma página com uma lista contendo os pedidos pendentes numero da reserva {int}, localizacao {string}, sala {string}, data {string}, horario da reserva {string}, usuario {string}, capacidade{int} e editar {string}") do |int ,string1, string2, string3, string4, string 5, string 6|
    expect(page).to have_content(int)
    expect(page).to have_content(string1)
    expect(page).to have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(string4)
    expect(page).to have_content(string5)
    expect(page).to have_content(int)
    expect(page).to have_content(string7) 
end

Quando("eu clicar no botao {string}") do |string|
    click_link("#{string}")
  end
  
  
  Então("eu devo ver uma mensagem {string}") do |string|
    page.has_content?("#{string}")
  end