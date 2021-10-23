Dado("a reserva desta sala tenha sido realizada pelo o usuário") do
    @appointment = Appointment.create(appointment_date: "10/04/2022", user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
end

Dado("a reserva ainda não tenha sido aprovada") do
    @appointment.update(status: 1)
    @appointment.save!
end

Então("eu devo ver pelo menos uma reserva nessa tabela") do
    visit(root_path)
    page.all('table#pendentes tr').count.should > 1
end

Dado("a reserva desta sala tenha sido realizado pelo o usuáro") do
    @appointment = Appointment.create(appointment_date: "10/04/2022", user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
end

Então("eu não devo ver nenhuma reserva nessa tabela") do
    visit(root_path)
    page.all('table#aprovados tr').count.should == 0
end