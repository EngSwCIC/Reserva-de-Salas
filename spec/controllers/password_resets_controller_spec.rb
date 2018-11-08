require "spec_helper"
require "rails_helper"

RSpec.describe PasswordResetsController, type: :controller do
    describe "resetting password" do
  
        describe "with success." do 
            let(:user) { FactoryBot.create(:user, :email => 'teste@unb.com.br') }
            let(:mail) { UserMailer.password_reset(user) }
            
            it "Should send an email when informed email is registered" do
                post :create, params: { :user => user, :password_reset => { :email => user.email } }
                expect(flash[:info]).to eq("Email enviado com instruções para troca de senha.")
            end
            it "Should send an email with instructions for resetting password" do
                expect(mail.subject).to eq("Recuperação de senha")
                expect(mail.body.encoded).to match('Recadastramento de Senha')
            end
            it "Should update users password" do
                put :update, params: { :id => user.id, :email => user.email, :user => { :password => 'novasenha123', :password_confirmation => 'novasenha123' }  }
                expect(flash[:success]).to eq("Senha alterada com sucesso.")
            end
        end
        
        describe "without success." do
            let(:user) { FactoryBot.create(:user, :email => 'teste2@unb.com.br') }
            
            it "Should not send an email when informed email is not registered" do
                fake_email = 'naoexiste@unb.br'
                post :create, params: { :user => user, :password_reset => { :email => fake_email } }
                expect(response).to render_template :new
            end
            it "Should not change password when password and password confirmation do not match" do 
                put :update, params: { :id => user.id, :email => user.email, :user => { :password => 'sen', :password_confirmation => 'senhasenha' }  }
                expect(flash[:info]).to eq("Senha e/ou confirmação de senha incorretas. Senha precisa ter 6 caracteres.")
            end
            it "Should not change password when password it is a bad one" do
                put :update, params: { :id => user.id, :email => user.email, :user => { :password => '12', :password_confirmation => '12' }  }
                expect(flash[:info]).to eq("Senha e/ou confirmação de senha incorretas. Senha precisa ter 6 caracteres.")
            end
            it "Should not change password when password is left blank" do
                put :update, params: { :id => user.id, :email => user.email, :user => { :password => '', :password_confirmation => '' }  }
                expect(flash[:info]).to eq("Insira uma senha.")
            end  
        end

    end
end