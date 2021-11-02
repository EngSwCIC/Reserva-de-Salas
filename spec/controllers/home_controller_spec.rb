require 'simplecov'
SimpleCov.start 'rails'

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    let(:user) { FactoryBot.create(:user) }
    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }
   
    describe "GET #index" do
        # Happy Path
        context "when admin is signed in" do
            before do
                sign_in admin_user
            end

            it "redirects the admin to the backoffice" do
                get :index
                expect(response).to redirect_to(backoffice_path)
            end
        end

        # Happy Path
        context "when user is signed in" do
            before do
                sign_in user
            end

            it "redirects the registered user to the backoffice" do
                get :index
                expect(response).to redirect_to(backoffice_path)
            end
        end

        # Sad Path
        context "when user is not signed in" do
            it "directs the user to the index page"  do
                get :index
                expect(response).to have_http_status(:success)
            end
        end
    end
end