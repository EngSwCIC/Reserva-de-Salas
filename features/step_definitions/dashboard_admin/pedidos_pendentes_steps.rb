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


  Dado('que esteja na página “backoffice”') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('eu clicar em {string}.') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('eu devo ver uma tabela com todas as salas e horários reservados:') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('quando eu clicar em editar,') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Entao('poder aceitar ou recusar a reserva..') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('eu clicar em “Mostrar os Pedidos Pendentes” no dashboard do administrador') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('eu permaneço no dashboard do administrador') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('deve aparecer um alerta de nenhum pedido pendente.') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  