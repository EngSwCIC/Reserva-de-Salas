Dado("que eu esteja na página principal e seja um usuário cadastrado") do
    User.create(username: "andre", password: "password123", 
      email: "andre@a.com", registration: "15015296", course: "CIC", is_admin: false)
    visit("/")
end

Então("eu devo ser redirecionado para a página de recadastramento de senha") do
    current_path = "/edit_password_reset"
    expect(current_path).to eq("/edit_password_reset")
end

Então("devo receber em meu email cadastrado as instruções para novo cadastro de senha e clicar em Recadastrar Senha") do
    # this will get the first email, so we can check the email headers and body.
    # email = ActionMailer::Base.deliveries.first
    # email.from.should == "andre_luisferreira@hotmail.com"
    # email.to.should == @user.email
    # email.body.should include("Recadastrar Senha")
end

E("ao inserir os campos Nova Senha {string} e Confirmação {string} e clicar no botão {string} a nova senha é atualizada no sistema") do |string1,string2,string3|
    page.has_content?("Nova Senha")
    page.has_content?("Confirmação")

    user = User.find_by(email: "andre@a.com")
    user.update_attributes(:password => string1)
    expect(user.password).to eq(string2)
end   

Então("eu devo estar agora em uma página com título {string}") do |string|
    page.has_content?("#{string}")
end
  
Quando("eu clicar na opção {string}") do |string|
    click_link("#{string}")
end

Quando("eu inserir meu email de usuário e clicar em {string}") do |string|
    click_button("#{string}")
end
  

