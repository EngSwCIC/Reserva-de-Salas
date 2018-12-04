require 'rails_helper'

RSpec.describe 'Appointment API', type: :request do
    let(:user) { FactoryBot.create(:user, :email => '123@123.com') }
    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }

    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }

    describe 'GET #new' do

    end

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

            context 'when appointment is duplicated' do
            		before do
                	@appointment_duplicated_credentials = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id, :user_id => user.id)
                    @appointment_duplicated_credentials2 = FactoryBot.attributes_for(:appointment, :room_id => @room.id, :format => @room.id, :user_id => user.id)
                    post "/appointments", params: @appointment_duplicated_credentials
                    post "/appointments", params: @appointment_duplicated_credentials2
            		end
            		it 'should render a success flash message' do
                		expect(flash[:notice]).to eq("Seu aluguel foi solicitado a um administrador pois a sala já está reservada")
                end
                it 'should make the first appointment status approved' do
                    expect(Appointment.find_by(:appointment_date => @appointment_duplicated_credentials[:appointment_date], :room_id => @appointment_duplicated_credentials[:room_id], :user_id => @appointment_duplicated_credentials[:user_id], :status => '2')).to be_truthy
                end
                it 'should make the duplicated appointment status requested' do
                	expect(Appointment.find_by(:appointment_date => @appointment_duplicated_credentials2[:appointment_date], :room_id => @appointment_duplicated_credentials2[:room_id], :user_id => @appointment_duplicated_credentials2[:user_id], :status => '1')).to be_truthy
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

    describe 'GET #edit' do
        context 'when user is signed in' do
            before do
                sign_in user
                @room = FactoryBot.create(:room)
                @appointment = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                get "/appointments/#{@appointment.id}/edit"
            end

            it 'should render edit template' do
                expect(response).to render_template(:edit)
            end
        end
    end


    describe 'GET #all_appointments' do
        context 'when user is signed in' do
            before do
                sign_in user
                get '/all-appointments'
            end

            it 'should render edit template' do
                expect(response).to render_template(:all_appointments)
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
    describe 'PUT #update' do
        context 'when appointment exists' do
            before do
                sign_in admin_user
            end
            context 'when params are valid' do
                let(:appointment_params) {FactoryBot.attributes_for(:appointment)}
                before do
                    @room = FactoryBot.create(:room)
                    @appointment = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                    put "/appointments/#{@appointment.id}", params: { :appointment => appointment_params }
                end

                it 'update a appointment' do
                    expect(Appointment.find_by(status: appointment_params[:status])).to be_truthy
                end

                it 'should render a flash success message' do
                    expect(flash[:notice]).not_to be_nil
                end
            end
            context 'when params not are valid' do
                let(:appointment_params) {FactoryBot.attributes_for(:appointment, :status => '')}
                before do
                    @room = FactoryBot.create(:room)
                    @appointment = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
                    put "/appointments/#{@appointment.id}", params: { :appointment => appointment_params }
                end

                it 'update a appointment' do
                    expect(Appointment.find_by(status: appointment_params[:status])).not_to be_truthy
                end
            end
        end

    end
    describe 'GET #weeks-appointment' do
      context 'when admin is signed in' do
        before do
          sign_in admin_user
          @room = FactoryBot.create(:room)
          @appointment1 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
          @appointment1.appointment_date = Date.today.beginning_of_week
          @appointment1.save
          @appointment2 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id)
          @appointment2.appointment_date = Date.today.end_of_week
          @appointment2.save
          get '/weeks-appointments'

        end

        it 'renders weeks appointments template' do
            expect(response).to render_template(:weeks_appointments)
        end

        it 'should display the list with appointments for the week' do
          expect(assigns(:weeks_appointments)).to include(@appointment1, @appointment2)
        end

      end
    end
end