require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
    let(:user) { FactoryBot.create(:user, :email => '123@123.com')}

  describe 'GET #myappointments' do
    context 'When a user is signed in' do
      before do
        sign_in user
        @room = FactoryBot.create(:room)
      end

      it "returns http success" do
        get :my_appointments
        expect(response).to have_http_status(:success)
      end

      context 'When a user made a appointment and is pending' do
        before do
          @appointment1 = FactoryBot.create(:appointment, 
                                            :user_id => user.id, 
                                            :room_id => @room.id, 
                                            :status => 1)
          get :my_appointments
        end

        it 'Must show status as Solicitado' do
          expect(assigns(:my_appointments)).to include(@appointment1)
        end
      end

      context 'When a user made a appointment and was approved' do
        before do
          @appointment2 = FactoryBot.create(:appointment, 
                                            :user_id => user.id, 
                                            :room_id => @room.id, 
                                            :status => 2)
          get :my_appointments
        end
        it 'Must show status as Aprovado' do
          expect(assigns(:my_appointments)).to include(@appointment2)  
        end
      end

      context 'When a user made a appointment and was rejected' do
        before do
          @appointment3 = FactoryBot.create(:appointment, 
                                            :user_id => user.id, 
                                            :room_id => @room.id, 
                                            :status => 3)
          get :my_appointments
        end                                           
        it 'Must show status as Reprovado' do
          expect(assigns(:my_appointments)).to include(@appointment3) 
        end
      end
    end
  end
end
