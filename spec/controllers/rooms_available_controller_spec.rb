require 'rails_helper'

RSpec.describe RoomsAvailableController, type: :controller do
	let(:user) { FactoryBot.create(:user, :email => '123@123.com')}

  describe "GET #show" do
  context 'when user is signed in' do
        before do
            sign_in user
            @room = FactoryBot.create(:room)
        end	
    it "returns http success" do
      get :show , params: {id: @room.id}
      expect(response).to have_http_status(:success)
    end
    context 'when appointment change availability' do 
            before do
                @appointment1 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id,
                 :status => 2, :appointment_date => Date.today)
                @date = Date.today.strftime("%a (%d/%b)")
                @date2 = (Date.today + 1).strftime("%a (%d/%b)")
                get :show , params: {id: @room.id}
            end
            it 'expected less available time in day' do
                expect(assigns(:available)).to include(@date => ["06:00", "08:00", "12:00", "14:00", "16:00", "18:00", "20:00", "22:00"])
            end
            it 'expected same available time in other day' do
                expect(assigns(:available)).to include(@date2 =>["06:00", "08:00", "10:00","12:00", "14:00", "16:00", "18:00", "20:00", "22:00"])
            end
        end
        context 'when appointment does not change availability' do 
            before do
                @appointment1 = FactoryBot.create(:appointment, :user_id => user.id, :room_id => @room.id,
                 :status => 1, :appointment_date => Date.today)
                @date = Date.today.strftime("%a (%d/%b)")
                @date2 = (Date.today + 1).strftime("%a (%d/%b)")
                get :show , params: {id: @room.id}
            end
            it 'expected same available time in day' do
                expect(assigns(:available)).to include(@date =>["06:00", "08:00", "10:00","12:00", "14:00", "16:00", "18:00", "20:00", "22:00"])
            end
            it 'expected same available time in other day' do
                expect(assigns(:available)).to include(@date2 =>["06:00", "08:00", "10:00","12:00", "14:00", "16:00", "18:00", "20:00", "22:00"])
            end
        end
  end
	end
end