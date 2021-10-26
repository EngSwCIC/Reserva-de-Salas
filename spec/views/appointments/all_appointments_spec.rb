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
        @appointment.status = 2
        expect(@appointment.status).to eq(2)
      end
  
      # Rafael
      it 'Estado muda para reprovado' do
        @appointment.status = 0
        expect(@appointment.status).to eq(0)
      end

      # Tong
      it 'Estado solicitado' do
        @appointment.status = 1
        expect(@appointment.status).to eq(1)
      end  
    end
  end
end