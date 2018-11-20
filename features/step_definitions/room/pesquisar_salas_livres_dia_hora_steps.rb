Dado("exista o seguinte aluguel cadastrado no sistema:")do |table|
	table.rows_hash.each do |field, value|
	    @appointment = Appointment.new
	    @appointment.appointment_date = Date.today + 1
	    @appointment.start_time = value
	    @appointment.user_id = User.last.id
	    @appointment.room_id = Room.where(name: value, location:value).ids
	    @appointment.save
  end

end


Quando("selecionar o seguinte horário de {string} da manhã para buscar") do |string|
  select string, from: "time_search"
end