class UsersController < ApplicationController
  def show
    #@users = User.all
    #@search = User.ransack(params[:q])
    #@users = @search.result
    #@search.build_condition

    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
