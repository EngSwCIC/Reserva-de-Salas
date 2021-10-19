require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  let(:admin) { FactoryBot.create(:user, :is_admin => true) }

  before (:each) do
    sign_in admin
    @room = FactoryBot.create(:room)
  end

  context 'Existe uma reserva' do
    before (:each) do
      @appointment = FactoryBot.create(:appointment, :user_id => admin.id, :room_id => @room.id)
      @appointment_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id)
    end

    # Leo
    it 'Estado aprovado persiste ao recarregar a página' do
      @appointment.status = 2 # aprovado
      post "/appointments", params: @appointment_credentials
      expect(@appointment.status).to eq(2)
    end
  end

  # Marquin
  context 'Quando o status for reprovado' do
    before (:each) do
      @appointment = FactoryBot.create(:appointment, :user_id => admin.id, :room_id => @room.id, :status => 0)
      @appointment_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id)
    end

    it 'O status deve continuar como reprovado ao recarregar a página' do
        within('form') do
          expect(page).to have_checked_field('Reprovar')
        end
    end
  end
end
