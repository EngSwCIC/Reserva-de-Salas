require "spec_helper"
require "rails_helper"

RSpec.describe AppointmentsController, type: :controller do
    describe "status notification" do
        let(:admin_user) { FactoryBot.create(:user, :is_admin => true) }
  
        describe "with success." do 
            let(:user) { FactoryBot.create(:user, :email => "123@123.com") }
            let(:room) { FactoryBot.create(:room) }
            let(:appointment) { FactoryBot.create(:appointment, :status => 2, :user_id => user.id, :room_id => room.id) }          
            let(:mail) { UserMailer.status_notification(appointment) }

            before do
                sign_in admin_user
            end
                    
            it "Should send an email when status of appointment is changed by admin user" do
                put :update, params: { :id => appointment.id, :appointment => { :status => 2}, :status_old => 1 }
                expect(flash[:info]).to eq("Email enviado ao usuário com status de sua reserva.")
            end
            it "Should send an email to the correct email address" do
                expect(mail.to).to eq(["123@123.com"])
            end
        end

    end
end