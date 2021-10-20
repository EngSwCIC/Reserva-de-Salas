require 'rails_helper'

RSpec.describe Backoffice::DashboardController do
    describe "Today's appointments" do
        it "returns today's appointments" do
            
            get :index
            expect(assigns (:todays_appointments)) . to eq ( Hash.new )
        end

    end
end