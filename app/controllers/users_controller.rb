class UsersController < ApplicationController
  before_action :set_user

  def show
    @todos = @user.todos.order(id: :asc, level: :asc, created_at: :asc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
