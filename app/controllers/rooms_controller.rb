##
# Controlador da lógica da sala, controla as chamadas das operações de CRUD das salas
class RoomsController < ApplicationController
	before_action :signed_in?
	before_action :is_admin?, only: [:new, :create, :destroy]
	def new
		@room = Room.new
	end

	def index
		@rooms = Room.all
	end

	def show
		p_id = params[:id]
		if ! Room.exists?(id: p_id) then
			flash[:alert] = "A sala procurada não existe!"
			redirect_to rooms_path
		else
			@appointments = select_appointments
		end
	end
	
	def edit
		@room = Room.find(params[:id])
	end

	def update
		@room = Room.find(params[:id])
		if @room.update(room_params)
			redirect_to @room
			flash[:notice] = "A sala foi editada com sucesso!"
		else
			danger_update
		end
	end

	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:notice] = "A sala foi criada com sucesso!"
		else
			flash[:danger] = "A sala não pôde ser criada!"
		end

		redirect_to backoffice_path
	end

	def destroy
		Room.find(params[:id]).destroy
		flash[:danger] = "A sala foi excluída"
		redirect_to backoffice_path
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

	def danger_update
		flash[:danger] = "A sala não pôde ser editada! Tente novamente!"
		flash.keep(:danger)
		render 'edit'
	end

	def select_appointments
		p_id = params[:id]
		today = Date.today

		if params.has_key?(:filter) and params[:filter] == "history"
			Appointment.where('appointment_date < ? AND room_id = ?', today, p_id).all.order("appointment_date DESC, start_time DESC")
		else
			Appointment.where('appointment_date >= ? AND room_id = ?', today, p_id).all.order("appointment_date ASC, start_time ASC")
		end
	end

	##
	# GET /rooms/new
	# Parâmetros permitidos para a criação dos campos nome, local e capacidade da sala
	# POST /rooms
	# Assim como para renderizar na view do usuário, e assim um usuário não administrador
	# poder ver a capacidade máxima da sala
	def room_params
		params.require(:room).permit(:name, :location, :students)
	end
end
