class LikesController < ApplicationController
  before_action :set_todo
  before_action :check_current_user

  def create
    current_user.like(@todo)
    turbo_stream
  end

  def destroy
    current_user.unlike(@todo)
    turbo_stream
  end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def check_current_user
    unless current_user
      flash[:alert] = t("flash.likes.check_current_user.alert")
      render turbo_stream: turbo_stream.update("flash", partial: "shared/flash")
    end
  end
end
