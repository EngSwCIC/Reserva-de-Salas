Dado("que exista um pedido de reserva") do
    @room = Room.create(name: "sala2", students: 15, location: "UnB")
  end
  
  Dado("que a reserva tenha sido realizada em uma data passada") do
    @appointment = Appointment.create(appointment_date: "10/04/2021", user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
  end
  
  Então("devo ver uma tabela com título {string}") do |string|
    expect(page).to have_content(string)
  end
  
  Então("devo ver pelo menos uma reserva nessa tabela com data passada") do
    page.all('table#expiradas tr').count.should >= 1
  end
  
  Dado("que a reserva tenha sido realizada para o dia atual") do
    @appointment = Appointment.create(appointment_date: Date.today, user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
  end

  Então("devo ver nenhuma reserva nessa tabela com data passada") do
    page.all('table#expiradas tr').count.should == 1
  end