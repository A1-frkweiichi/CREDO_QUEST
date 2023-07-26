class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    DEFAULT_TODOS
  end
end
