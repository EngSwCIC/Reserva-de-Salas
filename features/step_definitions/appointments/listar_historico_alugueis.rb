# This is the steps file referred to index_for_appointments feature
# Place your code relative to that feature here
Dado("existam os seguintes alugueis cadastrados no meu nome:") do |table|
    @appointment = Appointment.new
    @appointment.user_id = User.last.id
    table.rows_hash.each do |field, value|
        @appointment.appointment_date = value
        @appointment.start_time = value
    end
    @appointment.save
end

Então("eu devo estar em uma página que contenha a seguinte tabela:") do |table|
    table.rows_hash.each do |field,value|
        expect(page).to have_content(value)
    end
end
