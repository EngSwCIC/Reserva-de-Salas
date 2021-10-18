require 'rails_helper'

RSpec.describe 'appointments/all_appointments.html.erb', type: :view do
  describe 'POST #update' do
    context 'when admin is signed in' do
  
      # Checks if appointment status is approved
      it 'Estado muda para aprovado' do
        # Approved appointment 0 <- (1) -> 2
        appointment = Appointment.new(:status => 2)
        expect(appointment.status).to eq(2)
      end
  
      # Rafael
      it 'Estado muda para reprovado' do
        app = Appointment.new(:status => 0)
        expect(app.status).to eq(0)
      end
      # Tong
      it 'Estado sem mudança' do
        pending(':status == inicial/default')
      end  
    end
  end
end
