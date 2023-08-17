class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(level: :desc).page(params[:page]).per(15)
  end

  def show
    @default_todos_grouped = @user.todos.default_todos.order(id: :asc).group_by(&:category)
    @categories_progress = @user.categories_progress
    # @user_todos_grouped = @user.todos.user_todos.order(id: :desc).group_by(&:category)
    @following_users = @user.following
    @follower_users = @user.followers
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
