#language: pt
#encoding: utf-8

Dado('que eu sou administrador do sistema logado que esteja na página backoffice') do 
    visit(backoffice_path)
end

Dado('que eu clique em um botao {string}') do 
    click_button("#{string}")
end  

Então('eu devo ver em um texto {string} com a quantidade de horarios total que estão reservados.') do |string|
    expect(page.has_content?("#{string}")).to be true
end
  
Então('devo ver nada ou {string}') do |string|
    expect(page.has_content?("#{string}")).to be true
end
  