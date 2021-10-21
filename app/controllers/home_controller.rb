class HomeController < ApplicationController
	def index
	  if current_user
		redirect_to backoffice_path
	  end
	end
end