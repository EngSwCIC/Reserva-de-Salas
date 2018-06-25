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
end
