require 'rails_helper'

describe UsersController do
    
    let(:user) { FactoryBot.create(:user) }
    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }
    
    describe 'GET #index' do
        context 'when admin is signed in' do 
            before do
                sign_in admin_user
                get :show
            end
        
            it 'should render index template' do
                expect(response).to render_template(:show)
            end

            it 'should render a collection of users' do
                expect(assigns(:users)).not_to be_nil
            end

            it "should render 5 or less users on the first page" do
                user = User.all
                test_user = user[0..4]
                expect(assigns(:users)).to eq(test_user)
            end

            it "should be possible to redirect to page 1 and render 5 or less users" do
                expect(:get => "/users/show?page=1").to route_to(:controller => "users", :action => "show", :page => "1")
                expect(:get => "/users/show?page=1").to be_routable
                get "show", :params => {:page => "1"}
                user = User.all
                test_user = user[0..4]
                expect(assigns(:users)).to eq(test_user)
            end

            it "should not be possible to redirect to page 2" do
                #expect(get "show", :params => {:page => "2"}).to raise_error( overflow: :exception )
            end 
            
        end

        context "when user is signed in" do
            before do
                sign_in user
                get :show
            end

            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
        
    end

end