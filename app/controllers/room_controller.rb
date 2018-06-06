class RoomController < ApplicationController
	before_action :signed_in?
	before_action :is_admin?, only: [:new, :create]
	def new
		@room = Room.new
	end

	def index
		@rooms = Room.all
	end

	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:notice] = "A sala foi criada com sucesso!"
			redirect_to backoffice_path
		else
			flash[:danger] = "A sala não pôde ser criada!"
			redirect_to backoffice_path
		end
	end

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

		def room_params
			params.require(:room).permit(:name, :location)
		end
end
