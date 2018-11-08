Dado("que eu esteja logado no sistema com o seguinte login de usuario comum {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2, 
        registration: "15015296", course: "CIC"
      )
      visit new_user_session_path
      fill_in :user_email, with: string
      fill_in :user_password, with: string2
      click_button "Log in"
      visit rooms_path
  end


  Dado("estejam cadastrados no sistema as seguintes salas:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.rows_hash.each do |field, value|
        @room = Room.new
        @room.name = value
        @room.location = value
        @room.tipo_sala = value
        @room.save
      end
  end
  
  Dado("eu esteja na {string} onde sera exibido uma lista com todas as salas cadastradas") do |string|
    expect(current_path).to eq("/#{string}")
  end

  Quando("eu clicar no botão {string} será exibido uma lista com os tipos de salas existentes para serem alugadas:") do |string, table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
  end

  Então("Ao escolher o tipo {string}, a lista será filtrada e atualizada de acordo:") do |string, table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
  end
  