class RoomsController < ApplicationController
	def new
		@room = Room.new
	end
	def index
		@rooms = Room.all
	end
	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:success] = "A sala foi criada com sucesso!"
			redirect_to backoffice_path
		else
			flash[:danger] = "A sala não pôde ser criada!"
			redirect_to backoffice_path
		end
	end

	private

		def room_params
			params.require(:room).permit(:name, :location)
		end
end
