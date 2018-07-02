class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

	def signed_in?
		if current_user
			true
		else
			flash[:danger] = "Você não pode acessar essa página"
			return redirect_to '/'
		end
  	end

	def is_admin?
		if current_user.is_admin
			true
		else
			flash[:danger] = "Você não pode acessar essa página"
			return redirect_to '/'
		end
	end
  
  protected
  	def after_sign_in_path_for(resource_or_scope)
  		if current_user.is_admin?
  			backoffice_path
  		else
  			root_path
  		end
	end
end
