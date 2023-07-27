class UsersController < ApplicationController
  before_action :set_user

  def show
    @todos = @user.todos.order(id: :asc, level: :asc, created_at: :asc)
  end

  def edit
  end

  def destroy
    @user.destroy
    reset_session
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
