##
# Classe Controller que é responsável por gerenciar o sistema de salas
# Se o usuário comum estiver logado, ele pode somente visualizar as salas
# Se o usuário administrador estiver logado, ele pode criar, editar e remover uma sala

class RoomsController < ApplicationController

    before_action :signed_in?
	before_action :is_admin?, only: [:new, :create, :destroy]
	
	##
  	# GET /rooms/new
  	# Descrição: Controller cria uma sala nova
  	# Valor de retorno: Retorna a sala criada
  	# Argumentos: Parâmetros da sala a ser criada
	# Colaterais: Nenhum colateral.
	def new
		@room = Room.new
	end

	##
  	# GET /rooms
  	# Controller que lista todas as salas do sistema usando paginação
    # Pode receber como parâmetro o número da página desejada GET /rooms?page=x sendo x o número da página
	# @pagy recebe o parâmetro, default=1
    # @rooms recebe  o resultado da busca no banco de dados, seu tamanho é sempre menor ou igual a 5
	def index
		@pagy, @rooms = pagy(Room.all)
	end

	##
  	# GET /rooms/show
  	# Descrição: Controller que faz a busca de uma sala específica.
  	# Valor de retorno: Retorna a sala caso seja encontrada.
  	# Argumentos: recebe o 'id' da sala.
	# Colaterais: Nenhum colateral.
	def show
		@room = Room.find(params[:id])
	end

	##
  	# GET /rooms/edit
  	# Descrição: 
  	# Valor de retorno: 
  	# Argumentos: recebe o 'id' da sala.
	# Colaterais: 
	def edit
		@room = Room.find(params[:id])
	end

	##
	# GET /rooms/<id>
  	# Descrição: Modifica as informações de uma sala no banco de dados
  	# Valor de retorno: 
  	# Argumentos: recebe o 'id' da sala.
	# Colaterais: Exibe uma mensagem com o status da operação (sucesso ou erro), e redireciona para
	# a página da sala modificada no banco em caso de sucesso. caso contrário redireciona para 
	# a página que permite preencher o formulário e modificar os dados da sala
	def update
		@room = Room.find(params[:id])
		if @room.update(room_params)
			redirect_to @room
			flash[:notice] = "A sala foi editada com sucesso!"
		else
			flash[:danger] = "A sala não pôde ser editada! Tente novamente!"
			render 'edit'
		end
	end

	##
  	# POST /rooms/create
  	# Descrição: Controller que faz a criação de uma nova sala.
  	# Valor de retorno: ???
  	# Argumentos: Recebe os dados da sala.
	# Colaterais: Exibe uma mensagem com o status da operação (sucesso ou erro), e cria
	# a sala no banco em caso de sucesso. Ao final redireciona para a página principal.
	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:notice] = "A sala foi criada com sucesso!"
		else
			flash[:danger] = "A sala não pôde ser criada!"
		end
		redirect_to backoffice_path
	end

	##
  	# GET /rooms/destroy
  	# Descrição: Controller que exclui uma sala já criada.
  	# Valor de retorno: ???
  	# Argumentos: Recebe como parâmetro o 'id' da sala para fazer a query.
	# Colaterais: Exibe uma mensagem de sucesso caso tenha excluído a sala e redireciona para a
	# página principal.
	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		flash[:danger] = "A sala foi excluída"
		redirect_to backoffice_path
	end


	private

	##
  	# Descrição: O metódo checa se um usuário está logado.
  	# Argumentos: o metódo não recebe nenhum argumento
	# Valores de retorno: Retorna Retorna um 'boolean' se o usuário estiver logado, se não for invoca
	# o método 'no_permission'.
	# Colaterais:Nenhum colateral. Nenhum
	#def signed_in?
		#if current_user
			#true
		#else
			#no_permission()
		#end
  	#end

	def signed_in?
    	if !current_user
            flash[:danger] = "Você não pode acessar essa página"
            return redirect_to '/'            
        end
            return true
    end

	##
  	# Descrição: Método que verifica se o usuário logado é um administrador ou não.
  	# Valor de retorno: Retorna um 'boolean' se o usuário for administrador, se não for invoca
	# o método 'no_permission'.
  	# Argumentos: Não recebe nenhum parâmetro.
	# Colaterais: Nenhum colateral.
	#def is_admin?
	#	if current_user.is_admin
	#		true
	#	else
	#		no_permission()
	#	end
	#end

	def is_admin?
        if !current_user.is_admin
            flash[:danger] = "Você não pode acessar essa página"
            return redirect_to '/'        
        end
                return true
    end
	
	##
  	# Descrição: Método invocado quando o usuário não tem as permissões necessárias para acessar a página.
  	# Valor de retorno: Não retorna nenhum valor.
  	# Argumentos: Não recebe nenhum parâmetro.
	# Colaterais: Exibe a mensagem indicando que o usuário não pode acessar a página e redireciona para a
	# página inicial.
	#def no_permission
	#	flash[:danger] = "Você não pode acessar essa página"
	#	return redirect_to '/'
	#end

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
