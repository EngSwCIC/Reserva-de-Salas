class UsersController < ApplicationController
  ##
  # Controller que lista todos os usuários do sistema
  # Assim como é responsável pela ordenação crescente e decrescente
  # e por realizar buscas no model User 
  def show
    ##
    # Variável de instância  @q recebe os parametros oriundos do search_form
    # @users recebe  o resultado da busca tanto para ordenação, quanto da busca
    # realizada no model User referente ao request do usuário
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
