require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
    describe 'GET #my_appointments' do
        context 'params are valid' do
            before do 
                @my_appointment = FactoryBot.create(:appointment)
                @my_appointment.user_id = @user.id
            end
            it 'expects a appointment in my appointment historic' do
                get :my_appointments
                expect(page).to have_content(@my_appointment)
            end
        end
    end
end
