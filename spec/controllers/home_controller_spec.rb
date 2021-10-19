require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    let(:user) { FactoryBot.create(:user) }
    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }
   
    describe "GET #index" do
        context "when admin is signed in" do
            before do
                sign_in admin_user
            end

            it "redirects the admin to the backoffice" do
                get :index
                expect(response).to redirect_to(backoffice_path)
            end
        end

        context "when user is signed in" do
            before do
                sign_in user
            end

            it "redirects the registered user to the backoffice" do
                get :index
                expect(response).to redirect_to(backoffice_path)
            end
        end
    end
end