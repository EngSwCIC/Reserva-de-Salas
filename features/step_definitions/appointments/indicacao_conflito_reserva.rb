
  Dado("que eu esteja logado no sistema com o seguinte login de administrador {string} e senha {string}") do |string, string2|
    User.create(username: 'admin', email: string, password: string2,
                registration: "15015296", course: "CIC"
    )
    visit new_user_session_path
    fill_in :user_email, with: string
    fill_in :user_password, with: string2
    click_button "Log in"
    visit all_appointments_path
  end

  Dado("estejam cadastrados no sistema os seguintes alugueis:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.rows_hash.each do |field, value|
      @appointment = Appointment.new
      @appointment.appointment_date = value
      @appointment.start_time = value
      @appointment.room_id = value
      @appointment.save
    end
  end

  Dado("eu esteja na {string} onde sera exibido uma lista com todos os alugueis, onde a cor do botão for azul significa que não ha conflito e se botão for vermelho há conflito de alugueis") do |string|
    expect(current_path).to eq("/#{string}")
  end

  Quando("eu clicar no botão {string} VERMELHO será exibido uma lista dos alugueis em CONFLITO:") do |string, table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.rows_hash.each do |field, value|
      expect(page).to have_content(value)
    end
  end

  Quando("eu clicar no botão {string} AZUL será exibido apenas o aluguel em questão:") do |string, table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.rows_hash.each do |field, value|
      expect(page).to have_content(value)
    end
  end