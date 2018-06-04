class RoomController < ApplicationController
	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:sucess] = "Room was sucessfully created!"
			redirect_to backoffice_path
		else
			render 'new'
		end
	end



	private

		def room_params
			params.require(:room).permit(:name, :location)
		end
end
