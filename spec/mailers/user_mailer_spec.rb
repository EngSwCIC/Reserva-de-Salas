require "spec_helper"
require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "password_reset" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Recuperação de senha")
      expect(mail.to).to eq(["silva@silva.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match('Recadastramento de Senha')
    end
  
  end
end
