require "spec_helper"
require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "password_reset" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    it "should render the headers" do
      expect(mail.subject).to eq("Recuperação de senha")
      expect(mail.to).to eq(["silva@silva.com"])
    end
    it "should render the body" do
      expect(mail.body.encoded).to match("Recadastramento de Senha")
    end
  end

  describe "status_notification" do
    let(:user) { FactoryBot.create(:user, :email => "123@123.com") }
    let(:room) { FactoryBot.create(:room) }
    let(:appointment) { FactoryBot.create(:appointment, :user_id => user.id, :room_id => room.id) }          
    let(:mail) { UserMailer.status_notification(appointment) }

    it "should render the headers" do
      expect(mail.subject).to eq("Status da sua reserva")
      expect(mail.to).to eq(["123@123.com"])
    end
    it "should render the body" do
      expect(mail.body.encoded).to match("Notifica=C3=A7=C3=A3o de Reserva")
    end
  end

end
