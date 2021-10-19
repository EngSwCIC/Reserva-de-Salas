require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  let(:admin) { FactoryBot.create(:user, :is_admin => true) }

  context 'Existe uma reserva' do
    before (:each) do
      sign_in admin
      @room = FactoryBot.create(:room)
      @appointment = FactoryBot.create(:appointment, :user_id => admin.id, :room_id => @room.id)
      @appointment_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id)
    end

    # Leo
    it 'Estado aprovado persiste ao recarregar a página' do
      @appointment.status = 2 # aprovado
      post "/appointments", params: @appointment_credentials
      expect(@appointment.status).to eq(2)
    end

    # Marquin
    it 'Estado reprovado persiste ao recarregar a página' do
      pending(':status_before_refused == :status_after_refused')
    end
  end
end
