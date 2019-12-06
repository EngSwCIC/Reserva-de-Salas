Dado("exista um aluguel para amanhã, para às {string}") do |app_date|
    @appointment = Appointment.new
    @appointment.appointment_date = Date.today + 1
    @appointment.start_time = app_date
    @appointment.user_id = User.last.id
    @appointment.room_id = Room.last.id
    @appointment.save
end

Então("eu devo ver a linha do dia de amanhã sem o horário {string}") do |horario|
    th = page.find(:css, 'th.date', text: (Date.today + 1).strftime("%a (%d/%b)"))
    tr = th.find(:xpath, './parent::tr')
    str = 'td.h' + horario[0,1]

    !tr.has_css?(str, text = '*')
end

Então("eu devo ver a linha do dia de amanhã com o horário {string}") do |horario|
    th = page.find(:css, 'th.date', text: (Date.today + 1).strftime("%a (%d/%b)"))
    tr = th.find(:xpath, './parent::tr')
    str = 'td.h' + horario[0,1]

    tr.has_css?(str, text = '*')
end