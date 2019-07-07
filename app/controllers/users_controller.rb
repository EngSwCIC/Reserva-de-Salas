class UsersController < ApplicationController
  def show
    @users = User.all
  end

  def showByOrder
    @users = User.order(username: :asc)
  end

end
