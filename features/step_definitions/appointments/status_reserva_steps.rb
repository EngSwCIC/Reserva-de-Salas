Quando("eu clicar no botão {string} para a requisição da sala {string} no horário de {string} da manhã") do |string, string2, string3|
    # printf("\n\nBODY = #{page.html}\n\n")
    # printf("\n\nBODY = #{page.body}\n\n")
    within("#table") do
        within(".appointment-data") do
            click_link_or_button(string)
        end
    end
end

Dado("que eu esteja logado como Administrador do Sistema") do
  
end

Dado("eu esteja na pagina Backoffice com caminho {string}") do |string|
  
end

Então("eu devo estar na página com uma tabela com os dados:") do |table|
  
end

Dado("que exista a sala {string}, {string} na data {string}") do |sala, hora, data|
  
end

Dado("que a data e horário atual sejam após  {string}, {string}") do |string, string2|
   # Write code here that turns the phrase above into concrete actions
end

Dado("que exista a sala {string}, {string}, {string} cadastrada no sistema") do |sala, hora, data|
  page.has_content?(sala)
  page.has_content?(hora)
  page.has_content?(data)
end

Dado("que a sala {string}, {string}, {string} não possua requisições no horário de {string} da manhã") do |string, string2, string3, string4|
   # Write code here that turns the phrase above into concrete actions
end

Dado("que a sala {string}, {string}, {string} possua requisições no horário de {string} da manhã") do |string, string2, string3, string4|
   # Write code here that turns the phrase above into concrete actions
end