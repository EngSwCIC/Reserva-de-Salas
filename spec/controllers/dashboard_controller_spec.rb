require 'rails_helper'
require 'date'

RSpec.describe Backoffice::DashboardController do
    describe "Today's appointments" do
        it "returns today's appointments from" do

            room = FactoryBot.build(:room, name: 'Sala 1')
            today_date = Time.new(Date.today.year, Date.today.month, Date.today.day, 0, 0, 0, "UTC")
            start_time = Time.new(2000, 1, 1, 16, 0, 0, "UTC")
            appoint_1 = FactoryBot.build(:appointment, room: room, room_id: room.id, id: 1, appointment_date: today_date, start_time: start_time)

            # puts today_date
            # puts appoint_1.appointment_date
            # puts start_time.strftime("%H:%M")
            # puts appoint_1.start_time.strftime("%H:%M")
            
            expect(Appointment).to receive(:where).and_return([appoint_1])
            expect(Room).to receive(:find).with(room.id).and_return(room)
            expected_result = [{room_name: room.name, time: start_time.strftime("%H:%M"), id: appoint_1.id }]

            get :index
            expect(assigns(:todays_appointments)). to eq(expected_result)
        end

    end
end