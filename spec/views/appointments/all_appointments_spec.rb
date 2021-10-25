require 'rails_helper'

RSpec.describe 'appointments/all_appointments.html.erb', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }

  describe 'POST #update' do
    context 'when admin is signed in' do
      # Approved appointment 0 <- (1) -> 2
      before do
        @room = FactoryBot.create(:room)
        @appointment = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
      end
      
      # Checks if appointment status is approved
      it 'Estado muda para aprovado' do
<<<<<<< HEAD
        pending(':status == 2')
=======
        @appointment.status = 2
        expect(@appointment.status).to eq(2)
>>>>>>> e7f34d155b1730214f1524927c744c14d2b1ed1d
      end
  
      # Rafael
      it 'Estado muda para reprovado' do
<<<<<<< HEAD
        app = Appointment.new(:status => 0)
        expect(app.status).to eq(0)
=======
        @appointment.status = 0
        expect(@appointment.status).to eq(0)
>>>>>>> e7f34d155b1730214f1524927c744c14d2b1ed1d
      end

      # Tong
      it 'Estado solicitado' do
        @appointment.status = 1
        expect(@appointment.status).to eq(1)
      end  
    end
  end
end