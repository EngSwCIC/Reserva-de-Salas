##
# Classe que controla a lógica da página inicial
class HomeController < ApplicationController
	##	
	# Se um usuário tentar acessar a página index, mas o mesmo estiver
	# logado na conta, ele é redirecionado para págind do backoffice.
	#
	# O método não recebe nenhum argumento e não retorna nenhum valor.
	#
	# O método tem como efeito colateral o redirecionamento para a
	# página backoffice.
	def index
	  if current_user
		redirect_to backoffice_path
	  end
	end
end