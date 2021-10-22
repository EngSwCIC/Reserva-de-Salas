require 'rails_helper'

RSpec.describe Backoffice::DashboardController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    context "when counting the amount of users" do
      let(:users) { User.all }

      context "when there are some users" do
        before do
          user1 = create(:user, email: "user1@gmail.com", username: "user1")
          user2 = create(:user, email: "user2@gmail.com", username: "user2")
          user3 = create(:user, email: "user3@gmail.com", username: "user3")
          user4 = create(:user, email: "user4@gmail.com", username: "user4")
        end

        it 'shows the correct amount of users' do
          expect(users.count).to eq(4)
        end
      end

      context "when there are no users" do
        it 'shows 0 users' do
          expect(users.count).to eq(0)
        end
      end
    end
  end
end
