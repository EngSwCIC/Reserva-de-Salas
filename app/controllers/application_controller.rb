class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	#protected
	#def after_sign_in_path_for(resource_or_scope)
	#	backoffice_path
	#end
  end
  