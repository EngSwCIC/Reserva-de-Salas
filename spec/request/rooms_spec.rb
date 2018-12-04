require 'rails_helper'

RSpec.describe 'Rooms API', type: :request do
    let(:user) { FactoryBot.create(:user) }
    let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }
    
    describe 'GET #new' do
        context 'when user is admin' do
            before do
                sign_in admin_user
                get '/rooms/new'
            end

            it 'should render the new template' do
                expect(response).to render_template(:new)
            end
        end

        context 'when user is not admin' do
            before do
                sign_in user
                get '/rooms/new'
            end

            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end

    describe 'GET #index' do
        context 'when user is signed in' do 
            before do
                sign_in user
                get '/rooms'
            end
            
            it 'should render a collection of rooms' do
                expect(assigns(:rooms)).not_to be_nil
            end
            
            it 'should render index template' do
                expect(response).to render_template(:index)
            end
        end
        
        context 'when user is not signed in' do
            before do
                get '/rooms'
            end
            
            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end
    
    describe 'GET #show' do
        let(:room) {FactoryBot.create(:room)}
        context 'when user is signed in' do
            before do
                sign_in user
                get "/rooms/#{room.id}"
            end
            
            it 'should get a instance of Room' do
                expect(assigns(:room)).to be_a_instance_of(Room)
            end
            
            it 'should render show template' do
                expect(response).to render_template(:show)
            end
        end
        
        context 'when user is not signed in' do
            before do
                get "/rooms/#{room.id}"
            end
            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end

    # metodo de teste que garante o funcionamento correto da feature filtro de sala
    describe 'GET #filtro' do
        let(:room) {FactoryBot.create(:room)}
        context 'when user is signed in' do
            before do
                sign_in user
                get "/filtro/#{room.id}"
            end
            
            it 'should render filtro template' do
                expect(response).to render_template(:filtro)
            end
        end
        
        context 'when user is not signed in' do
            before do
                get "/filtro/#{room.id}"
            end
            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end
        

    describe 'GET #edit' do
        let(:room) {FactoryBot.create(:room)}
        context 'when user is signed in' do
            before do
                sign_in user
                get "/rooms/#{room.id}/edit"
            end

            it 'should get a room instance' do
                expect(assigns(:room)).to be_a_instance_of(Room)
            end

            it 'should render edit template' do
                expect(response).to render_template(:edit)
            end
        end

        context 'when user is not signed in' do
            before do
                get "/rooms/#{room.id}"
            end
            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end

    describe 'POST #create' do
        context 'when user is admin' do
            before do
                sign_in admin_user
            end
            context 'when params are valid' do
                let(:rooms_credentials) {FactoryBot.attributes_for(:room)}
                before do
                    post '/rooms', params: { :room => rooms_credentials }
                end
                it 'should persist through database' do
                    expect(Room.find_by(:name => rooms_credentials[:name])).to be_truthy
                end

                it 'should render a flash success message' do
                    expect(flash[:notice]).not_to be_nil
                end
            end
            context 'when params are not valid' do
                let(:rooms_credentials) {FactoryBot.attributes_for(:room, :name => '')}
                before do
                    post '/rooms', params: { :room => rooms_credentials }
                end
                it 'should not persist through database' do
                    expect(Room.find_by(:name => rooms_credentials[:name])).not_to be_truthy
                end
                
                it 'should render a flash danger message' do
                    expect(flash[:danger]).not_to be_nil
                end
            end
        end
        
        context 'when user is not admin' do
            let(:rooms_credentials) {FactoryBot.attributes_for(:room, :name => '')}
            before do
                sign_in user
                post '/rooms', params: { :room => rooms_credentials }
            end

            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end

    describe 'PUT #update' do
        let(:room) { FactoryBot.create(:room) }
        context 'when user is admin' do
            before do
                sign_in admin_user
            end
            
            context 'when params are valid' do        
                let(:rooms_credentials) { FactoryBot.attributes_for(:room, :name => 'New Fake Name', :location => 'New Fake Location') }
                before do
                    put "/rooms/#{room.id}", params: { :room => rooms_credentials }
                end
                it 'should persist through database' do
                    expect(Room.find_by(:name => rooms_credentials[:name])).to be_truthy
                end

                it 'should render a flash success message' do
                    expect(flash[:notice]).not_to be_nil
                end
            end

            context 'when params are not valid' do
                let(:rooms_credentials) { FactoryBot.attributes_for(:room, :name => '', :location => 'New Fake Location') }
                before do
                    put "/rooms/#{room.id}", params: { :room => rooms_credentials }
                end
                it 'should not persist through database' do
                    expect(Room.find_by(:name => rooms_credentials[:name])).not_to be_truthy
                end
                
                it 'should render a flash danger message' do
                    expect(flash[:danger]).not_to be_nil
                end
            end
        end
        
        context 'when user is not admin' do
            let(:rooms_credentials) { FactoryBot.attributes_for(:room, :name => 'New Fake Name', :location => 'New Fake Location') }
            before do
                sign_in user
                post '/rooms', params: { :room => rooms_credentials }
            end

            it 'should render a flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end

    describe 'DELETE #destroy' do
        let(:room) { FactoryBot.create(:room) }
        context 'when user is admin' do
            before do
                sign_in admin_user
                delete "/rooms/#{room.id}"
            end
            
            it 'should persist through database' do
                expect(Room.find_by(:name => room.name)).to be_nil
            end            
            
            it 'should render a danger flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
        context 'when user is not admin' do
            before do
                sign_in user
                delete "/rooms/#{room.id}"
            end

            it 'should not persist through database' do
                expect(Room.find_by(:name => room.name)).not_to be_nil
            end            
            
            it 'should render a danger flash message' do
                expect(flash[:danger]).not_to be_nil
            end
        end
    end

    describe 'GET #search_rooms' do
        context 'when user is signed in' do 
            before do
                sign_in user
            end
            
            it 'should render search rooms page' do
                get '/search-rooms'
                expect(response).to render_template(:search_rooms)
            end
        end


        describe 'GET #search_result' do
            context 'when user is signed in' do 
                before do
                    sign_in user
                    @room1 = FactoryBot.create(:room)
                    @room2 = FactoryBot.create(:room)
                    @room3 = FactoryBot.create(:room)
                    @appointment1 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room1.id, :status => '2')
                    
                end

                context 'when search params are not null'do
                    before do
                        post '/search-result', params: { :date_search => '22-06-2018', :time_search => '10:00:00'}
                    end

                    it 'should get a collection of free rooms if params are valid' do
                        expect(Room.search_by('22-06-2018' ,'10:00:00')).to match_array([@room2, @room3])
                    end
                end

                context 'when search params are null' do
                    before do
                        post '/search-result', params: { :date_search => nil, :time_search => nil}
                    end
                    it 'should render search rooms page' do
                        expect(response).to redirect_to '/search-rooms'
                    end
                end

            end

        end
    end
end