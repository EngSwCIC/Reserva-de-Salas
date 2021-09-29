Quando("eu clicar no botão {string} para a requisição da sala {string} no horário de {string} da manhã") do |string, string2, string3|
    # printf("\n\nBODY = #{page.html}\n\n")
    # printf("\n\nBODY = #{page.body}\n\n")
    within("#table") do
        within(".appointment-data") do
            click_link_or_button(string)
        end
    end
end