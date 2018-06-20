require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
    describe 'GET #my_appointments' do
        context 'params are valid' do
            before do 
                @user = FactoryBot.create(:user)
                sign_in @user
                @room = FactoryBot.create(:room)
                @appointment1 = FactoryBot.create(:appointment, :user_id => @user.id, :room_id => @room.id)
                @appointment2 = FactoryBot.create(:appointment, :user_id => @user.id, :room_id => @room.id)
                get :my_appointments
            end
            
            it 'expects a few appointments in my appointment historic' do
                expect(assigns(:my_appointments)).to match_array([@appointment1,@appointment2])
            end

            it 'renders my appointments template' do
                expect(response).to render_template :my_appointments        
            end
        end
    end

    describe 'DELETE #destroy' do
        context 'when appointment exists' do
            let(:appointment_params) {FactoryBot.attributes_for(:appointment)}
            before do
                @user = FactoryBot.create(:user)
                sign_in @user
                @room = FactoryBot.create(:room)
                @appointment = FactoryBot.create(:appointment, :user_id => @user.id, :room_id => @room.id)
                get :my_appointments
                delete :destroy
            end

            it 'deletes a appointment' do
                expect(Appointment.find_by(appointment_date: appointment_params[:appointment_date])).not_to be_truthy
            end
        end
    end
end
