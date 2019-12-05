require 'rails_helper'

RSpec.describe MyAppointmentsController, type: :controller do
  describe 'GET #myappointments' do
    context 'When a user is signed in' do
      before do
        sign_in user
        @room = FactoryBot.create(:room)
      end

      it "returns http success" do
        get '/my_appointments'
        expect(response).to have_http_status(:success)
      end

      context 'When a user made a appointment and is pending'
        before do
          @appointment1 = FactoryBot.create(:appointment, 
                                            :user_id => user.id, 
                                            :room_id => @room.id, 
                                            :status => 1)
        end

        it 'Must show status as Solicitado'
          expect(assigns(:my_appointments)).to have_attributes(:status=> 1)  
        end
      end

      context 'When a user made a appointment and was approved'
        before do
          @appointment2 = FactoryBot.create(:appointment, 
                                            :user_id => user.id, 
                                            :room_id => @room.id, 
                                            :status => 2)
        end
        it 'Must show status as Aprovado'
          expect(assigns(:my_appointments)).to have_attributes(:status=> 2)  
        end
      end

      context 'When a user made a appointment and was rejected'
        before do
          @appointment3 = FactoryBot.create(:appointment, 
                                            :user_id => user.id, 
                                            :room_id => @room.id, 
                                            :status => 2)
        end                                           
        it 'Must show status as Reprovado'
          expect(assigns(:app)).to have_attributes(:status=> 3) 
        end
      end

    end
end
