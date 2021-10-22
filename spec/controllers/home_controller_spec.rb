require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "HomeController" do

    describe "approved_appointments" do
      it "calls the model method that return the approved_appointments" do
        user = User.create(username: 'user', email: 'user@mail.com', password: "123456",
          registration: "15015296", course: "CIC", is_admin: false
        )
        room = Room.create(name: "sala1", students: 5, location: "UnB")

        approved = Appointment.create(appointment_date: "10/04/2022", user_id: user.id, room_id: room.id, status: 2, start_time: Time.now)        
        not_approved = Appointment.create(appointment_date: "10/04/2022", user_id: user.id, room_id: room.id, status: 1, start_time: Time.now)        
        
        expect(controller.approved_appointments.exists?(id: approved.id)).to eq(true)
        expect(controller.approved_appointments.exists?(id: not_approved.id)).to eq(false)
      end
    end

    describe "expired_appointments" do
      it "calls the model method that return the expired_appointments" do
        user = User.create(username: 'user1', email: 'user1@mail.com', password: "1234567",
          registration: "15015286", course: "CIC", is_admin: false
        )
        room = Room.create(name: "sala2", students: 15, location: "UnB")

        expired = Appointment.create(appointment_date: "10/04/2021", user_id: user.id, room_id: room.id, status: 2, start_time: Time.new(2021, 4, 10))        
        not_expired = Appointment.create(appointment_date: Date.today, user_id: user.id, room_id: room.id, status: 2, start_time: Time.now)        

        expect(controller.expired_appointments.exists?(id: expired.id)).to eq(true)
        expect(controller.expired_appointments.exists?(id: not_expired.id)).to eq(false)
      end
    end
  
  end
end
