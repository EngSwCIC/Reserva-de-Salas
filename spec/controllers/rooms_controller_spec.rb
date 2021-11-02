require 'simplecov'
SimpleCov.start 'rails'

require 'rails_helper'
require 'date'

RSpec.describe RoomsController, type: :controller do
    let(:user) { FactoryBot.create(:user) }

    today = Date.today
    
    describe "GET #show" do
        context "when there are some appointments for a room" do
            
            history_list = Array.new(5)
            appointments_list = Array.new(5)
            
            # Happy Path
            before do
                sign_in user
                @room = FactoryBot.create(:room)

                # registros para histórico
                history_list[0] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today - 10, :start_time => "18:00:00", :user_id => user.id) 
                history_list[1] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today - 10, :start_time => "16:00:00", :user_id => user.id)
                history_list[2] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today - 20, :start_time => "16:00:00", :user_id => user.id)
                history_list[3] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today - 30, :start_time => "14:00:00", :user_id => user.id)
                history_list[4] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today - 365, :start_time => "10:00:00", :user_id => user.id)

                # registros para agendmaentos futuros
                appointments_list[0] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today + 10, :start_time => "18:00:00", :user_id => user.id) 
                appointments_list[1] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today + 10, :start_time => "20:00:00", :user_id => user.id)
                appointments_list[2] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today + 20, :start_time => "16:00:00", :user_id => user.id)
                appointments_list[3] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today + 30, :start_time => "14:00:00", :user_id => user.id)
                appointments_list[4] = FactoryBot.create(:appointment, :room_id => @room.id, :appointment_date => today + 365, :start_time => "10:00:00", :user_id => user.id)
            end
            
            context "when the history of appointments is required" do
                before do
                    get :show, params: {id: @room.id, filter: "history"}
                end
            
                it "shows the history of appointments" do
                    expect(assigns(:appointments)).to eq(history_list)
                end
            end

            context "when the future appointments are required" do
                before do
                    get :show, params: {id: @room.id, filter: "appointments"}
                end
            
                it "shows the future appointments" do
                    expect(assigns(:appointments)).to eq(appointments_list)
                end
            end
            
        end
        
        # Sad Path
        context "when the user tries to access a non-existent room" do
            before do
                sign_in user
                get :show, params: {id: 'X'}
            end

            it "redirects to the index page" do
                expect(response).to redirect_to(rooms_path)
            end
        end
    end
end