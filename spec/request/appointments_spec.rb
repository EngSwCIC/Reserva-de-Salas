require 'rails_helper'

RSpec.describe 'Appointment API', type: :request do
    let(:user) { FactoryBot.create(:user, :email => '123@123.com') }
    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }

    describe 'POST #create' do
        context 'when user is signed in' do
            before do
                sign_in user
                @room = FactoryBot.create(:room)
            end
            context 'when params are valid' do
                before do
                    @appointment_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id)
                    post "/appointments", params: @appointment_credentials
                end

                it 'should persist through database' do
                    expect(Appointment.find_by(:appointment_date => @appointment_credentials[:appointment_date], :room_id => @appointment_credentials[:room_id])).to be_truthy
                end

                it 'should render a success flash message' do
                    expect(flash[:notice]).not_to be_nil
                end
            end

            context 'when appointment is duplicate' do
            		before do
                		@appointment_duplicated_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id)
                    post "/appointments", params: @appointment_duplicated_credentials
                    post "/appointments", params: @appointment_duplicated_credentials
            		end
            		it 'should render a danger flash message' do
                		expect(flash[:danger]).not_to be_nil
                end
                it 'should not make duplicate appointments in database' do
                		expect(Appointment.find_by(:appointment_date => @appointment_duplicated_credentials[:appointment_date], :room_id => @appointment_duplicated_credentials[:room_id])).to be_truthy
                end
            end

            context 'when params are not valid' do
                before do
                    @appointment_fake_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :start_time => '')
                    post "/appointments", params: @appointment_fake_credentials
                end

                it 'should not persist through database' do
                    expect(Appointment.find_by(:appointment_date => @appointment_fake_credentials[:appointment_date], :room_id => @appointment_fake_credentials[:room_id])).to be_nil
                end

                it 'should render a danger flash message' do
                    expect(flash[:danger]).not_to be_nil
                end
            end
        end
    end


    describe 'GET #show' do
        context 'when user is signed in' do
            before do
                sign_in user
                @room = FactoryBot.create(:room)
                @appointment = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                get "/appointments/#{@room.id}"
            end

            it 'should render show template' do
                expect(response).to render_template(:show)
            end
        end
    end



    describe 'GET #my_appointments' do
        context 'params are valid' do
            before do 
                sign_in user
                @room = FactoryBot.create(:room)
                @appointment1 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                @appointment2 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                get '/my-appointments'
            end
            
            it 'expects a few appointments in my appointment historic' do
                expect(assigns(:my_appointments)).to match_array([@appointment1,@appointment2])
            end

            it 'renders my appointments template' do
                expect(response).to render_template(:my_appointments)
            end
        end
    end

    describe 'DELETE #destroy' do
        context 'when appointment exists' do
            let(:appointment_params) {FactoryBot.attributes_for(:appointment)}
            before do
                sign_in user
                @room = FactoryBot.create(:room)
                @appointment = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                delete "/appointments/#{@appointment.id}"
            end

            it 'deletes a appointment' do
                expect(Appointment.find_by(appointment_date: appointment_params[:appointment_date])).not_to be_truthy
            end
        end
    end

    describe 'GET #weeks-appointment' do
      context 'when admin is signed in' do
        before do
          sign_in admin_user
          @room = FactoryBot.create(:room)
          @appointment1 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
          @appointment1.appointment_date = Date.today.yesterday
          @appointment2 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
          @appointment2.appointment_date = Date.today.tomorrow
          @appointment3 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
          get '/weeks-appointments'

        end

        it 'should display the list with appointments'do
          expect(assigns(:weeks_appointments)).to match_array([@appointment1,@appointment2])
        end

        it 'renders weeks appointments template' do
          expect(response).to render_template(:weeks_appointments)
        end

      end
    end
end