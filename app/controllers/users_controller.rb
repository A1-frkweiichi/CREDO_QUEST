class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include UsersHelper

  def index
    @users = User.order(last_login_at: :desc).page(params[:page]).per(10)
  end

  def show
    @default_todos_grouped = @user.todos.default_todos.order(id: :asc).group_by(&:category)
    # @user_todos_grouped = @user.todos.user_todos.order(id: :desc).group_by(&:category)
    @completion_percentage = default_todos_completion_percentage
  end

  def edit
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to root_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
