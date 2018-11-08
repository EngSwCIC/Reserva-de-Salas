class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  #before_action :check_expiration, only: [:edit, :update]    # Case (1)

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email enviado com instruções para troca de senha."
      redirect_to user_session_url
    else
      flash.now[:danger] = "Email não encontrado."
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "Insira uma senha.")
      flash[:info] = "Insira uma senha."
      render 'edit'
    elsif @user.update_attributes(user_params)          # Case (4)
      flash[:success] = "Senha alterada com sucesso."
      redirect_to user_session_url
    else
      flash[:info] = "Senha e/ou confirmação de senha incorretas. Senha precisa ter 6 caracteres."
      render 'edit'                                     # Case (2)
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
       unless (@user)
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Link expirado."
        redirect_to root_url
      end
    end
end
