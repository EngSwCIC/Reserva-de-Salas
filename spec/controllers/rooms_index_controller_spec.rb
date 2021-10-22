require 'rails_helper'

describe RoomsController do
    let(:user) { FactoryBot.create(:user) }

    describe 'GET #index' do
        context 'when user is signed in' do 
            before do
                sign_in user
                get :index
            end

            it 'should render index template' do
                expect(response).to render_template(:index)
            end

            
            it "should render 5 or less rooms on the first page" do
                room = Room.all
                test_room = room[0..4]
                expect(assigns(:rooms)).to eq(test_room)
            end
            
            context 'exists only one room' do
                before do
                    @room = FactoryBot.create(:room)
                end
                
                it 'should render a collection of rooms' do
                    expect(assigns(:rooms)).not_to be_nil
                end
    
                it "should be possible to redirect to page 1 and render 5 or less rooms" do
                    expect(:get => "/rooms?page=1").to route_to(:controller => "rooms", :action => "index", :page => "1")
                    expect(:get => "/rooms?page=1").to be_routable
                    get "index", :params => {:page => "1"}
                    room = Room.all
                    test_room = room[0..4]
                    expect(assigns(:rooms)).to eq(test_room)
                end

                it "should not be possible to redirect to page 2"
                    expect {get "index", :params => {:page => "2"}}.to raise_error(Pagy::OverflowError)
                end

            end

            context 'exist 10 rooms' do
                before do
                    10.times {FactoryBot.create(:room)}
                end

                it "should be possible to redirect to page 2 and render 5 or less rooms"
                    expect(:get => "/rooms?page=2").to route_to(:controller => "rooms", :action => "index", :page => "2")
                    expect(:get => "/rooms?page=2").to be_routable
                    room = Room.all
                    test_room = room[5..9]
                    get "index", :params => {:page => "2"}
                    expect(assigns(:rooms)).to eq(test_room)
                end

                it "should not be possible to redirect to page 3"
                    expect {get "index", :params => {:page => "2"}}.to raise_error(Pagy::OverflowError)
                end
                
            end

        end
        
        context 'when user is not signed in' do
            before do
                get :index
            end

            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end

    end

end