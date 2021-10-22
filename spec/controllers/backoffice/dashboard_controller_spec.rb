require 'rails_helper'

RSpec.describe Backoffice::DashboardController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
			
      expect(response).to have_http_status(:success)
    end

    context "counting all rooms" do
      let(:rooms) { Room.all }

      context "when there are rooms" do
        before do
					@room1 = FactoryBot.create(:room, id: 10, name: 'Sala 1', location: "CIC", students: "10")
					@room2 = FactoryBot.create(:room, id: 11, name: 'Sala 2', location: "ICC", students: "60")
					@room3 = FactoryBot.create(:room, id: 12, name: 'Sala 3', location: "PAT", students: "200")
					@room4 = FactoryBot.create(:room, id: 13, name: 'Sala 4', location: "PJC", students: "90")

        end

        it 'shows the correct rooms number' do
					expected_result = 4
          expect(rooms.count).to eq(expected_result)
        end
      end

      context "when there are no rooms" do
        it 'shows 0 rooms' do
          expect(rooms.count).to eq(0)
        end
      end
    end
  end
end