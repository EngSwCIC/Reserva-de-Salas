Dado("que eu esteja cadastrado como um usuário") do
  @user = User.create(username: 'user', email: 'user@mail.com', password: "123456",
      registration: "15015296", course: "CIC", is_admin: false
  )
end

E("que eu esteja logado") do
  visit new_user_session_path
  fill_in :user_email, with: @user.email
  fill_in :user_password, with: @user.password
  click_button "Log in"
end

Então("eu devo ver {string} no topo da página") do |string|
  visit(root_path)
  expect(page).to have_content(string)
end

Dado("que exista uma sala cadastrada no sistema") do
  @room = Room.create(name: "sala1", students: 5, location: "UnB")
end

Dado("a reserva desta sala tenha sido realizado pelo o usuáro para uma data futura") do
  @appointment = Appointment.create(appointment_date: "10/04/2022", user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
end

Dado("a reserva tenha sido aprovada") do
  @appointment.update(status: 2)
  @appointment.save!
end

Então("eu devo ver três tabelas") do
  expect(page).to have_table('aprovados')
  expect(page).to have_table('pendentes')
  expect(page).to have_table('expirados')
end

Então("eu devo ver um tabela com título {string}") do |string|
  expect(page).to have_content(string)
end

Então("eu devo ver pelo menos uma reserva nessa tabela com data futura") do
  page.all('table#aprovados tr').count.should >= 1
end

Dado("a reserva desta sala tenha sido realizado pelo o usuáro para o dia atual") do
  @appointment = Appointment.create(appointment_date: Date.today, user_id: @user.id, room_id: @room.id, status: 1, start_time: Time.now)
end

Então("eu não devo ver nenhuma reserva nessa tabela com data futura") do
  page.all('table#aprovados tr').count.should == 0
end