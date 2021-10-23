require 'rails_helper'

RSpec.describe Backoffice::DashboardController, type: :controller do
  describe "GET #index" do
    describe ".count_users" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      context "when counting the amount of users" do
        let(:users) { User.all }

        context "when there are some users" do
          before do
            user1 = create(:user, email: "user1@gmail.com", username: "user1")
            user2 = create(:user, email: "user2@gmail.com", username: "user2")
            user3 = create(:user, email: "user3@gmail.com", username: "user3")
            user4 = create(:user, email: "user4@gmail.com", username: "user4")
          end

          it 'shows the correct amount of users' do
            expect(users.count).to eq(4)
          end
        end

        context "when there are no users" do
          it 'shows 0 users' do
            expect(users.count).to eq(0)
          end
        end
      end
    end

    describe ".todays_appointments" do
      it "returns today's appointments from" do
          room = FactoryBot.build(:room, name: 'Sala 1')
          today_date = Time.new(Date.today.year, Date.today.month, Date.today.day, 0, 0, 0, "+00:00")
          start_time = Time.new(2000, 1, 1, 16, 0, 0, "+00:00")
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

    describe ".pending appointments" do
     context "when counting the amount of appointments" do
        let(:appointments) { Appointment.all }
    
        context "when there are some appointments" do
          before do
            room = build(:room, name: 'Sala 1')
            today_date = Time.new(Date.today.year, Date.today.month, Date.today.day, 0, 0, 0, "+00:00")
            start_time = Time.new(2000, 1, 1, 16, 0, 0, "+00:00")
            user = create(:user)
            appoint_1 = create(:appointment, user_id: user.id, room: room, room_id: room.id, id: 1, appointment_date: today_date, start_time: start_time)
            appoint_2 = create(:appointment, user_id: user.id, room: room, room_id: room.id, id: 2, appointment_date: today_date, start_time: start_time)
            appoint_3 = create(:appointment, user_id: user.id, room: room, room_id: room.id, id: 3, appointment_date: today_date, start_time: start_time)
            appoint_4 = create(:appointment, user_id: user.id, room: room, room_id: room.id, id: 4, appointment_date: today_date, start_time: start_time)
    
          end
    
          it 'shows the correct amount of appointments' do
            expect(appointments.count).to eq(4)
          end
        end
    
        context "when there are no appointments" do
          it 'shows 0 appointments' do
            expect(appointments.count).to eq(0)
          end
        end
      end
    end
  end
end