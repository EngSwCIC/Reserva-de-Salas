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
    it 'O status deve continuar como aprovado ao recarregar a página' do
      @appointment.status = 2 # aprovado
      within('form') do
        expect(page).to have_checked_field('Aprovar')
      end
    end

    # Marquin
    it 'O status deve continuar como reprovado ao recarregar a página' do
      @appointment.status = 0 # reprovado
      within('form') do
        expect(page).to have_checked_field('Reprovar')
      end
    end
  end

end
