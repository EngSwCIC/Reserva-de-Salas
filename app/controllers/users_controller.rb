class UsersController < ApplicationController
  def show
    # @q recebe qual o parametro certo para fazer a busca do usuário certo
    @q = User.ransack(params[:q])
    # @users recebe o resultado da busca 
    @users = @q.result(distinct: true)
  end
end
