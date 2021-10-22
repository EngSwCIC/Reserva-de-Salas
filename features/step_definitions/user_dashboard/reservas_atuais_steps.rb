Então("eu devo ver as reservas para o dia atual em destaque nas tabelas") do
  page.all('table#aprovadas td#destaque').count.should >= 1
end

Dado("o aluguel desta sala tenha sido realizado pelo o usuáro para um dia que não seja o atual") do
  @appointment = Appointment.create(appointment_date: Date.today + 1, user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
end

Então("não deve haver nenhuma reserva em destaque nas tabelas") do
  page.all('table#aprovadas td#destaque').count.should == 0
end