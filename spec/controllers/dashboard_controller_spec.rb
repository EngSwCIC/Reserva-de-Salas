require 'rails_helper'

RSpec.describe Backoffice::DashboardController, type: :controller do
    describe "GET #index" do 
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end
end

#RSpec.describe Backoffice::DashboardController do
#    describe "number of reserved times" do
#        it "returns number of reserved timas appointments from" do
#
#            room = FactoryBot.build(:room, name: 'Sala 1')
#
#            expect(Room).to receive(:all).with(room.id).and_return(room)
#
#            expect(assigns(:number_appointments)). to eq(expected_result)
#        end
#    end
#end