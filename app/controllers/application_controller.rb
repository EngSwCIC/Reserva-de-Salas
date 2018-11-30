class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  protected
		#Método de redirecionamento de página após login.
  	def after_sign_in_path_for(resource_or_scope)
  		if current_user.is_admin?
  			backoffice_path
  		else
  			root_path
  		end
	end
end
