# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_admin_sign_up_params, only: [:create_as_admin]
  before_action :configure_account_update_params, only: [:update]

  def new
    super
  end

  # POST /resource
  def create
    super
  end

  ##
  # POST /users/registrations
  # Permite a criação de um novo usuário, criado por um usuário adminisitrador autenticado.
  # Valida antes de persistir se o email utilizado já está cadastrado
  # Retorna mensagens de erro ou redireciona para a página inicial caso o usuário seja criaido
  # com sucesso.
  def create_as_admin
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Usuário '" + @user.email + "' Criado com sucesso!"
    else
      flash[:danger] = "O email '" + @user.email+ "' já está cadastrado";
    end
    redirect_to request.referrer
  end

  def edit
    super
  end

  def update
    super
  end

  def delete
    super
  end

  private

    def user_params
      params.require(:user).permit(:email, :username, :course, :registration, :is_admin, :password, :password_confirmation)
    end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:username, :registration, :course, :is_admin])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :registration, :course])
  end

  ##
  # Parâmetros permitidos para o cadastro de usuários quando
  # se está logado como admin.
  # Diferença apenas do parâmetro "is_admin", que permite o cadastro
  # de outro usuário administrados
  def configure_admin_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :registration, :course, :is_admin])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :registration, :course, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
