class BackofficeController < ApplicationController
	layout 'backoffice'

	def user_list
    	@users = User.all
  	end

	def new
  		@user = User.new
  		# @user.is_admin = true
	end

	def edit
  		@user = User.find(params[:id])
	end
end
