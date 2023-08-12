class LikesController < ApplicationController
  before_action :set_todo

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
end
