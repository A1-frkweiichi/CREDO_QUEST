class LikesController < ApplicationController
  def create
    @todo = Todo.find(params[:todo_id])
    current_user.like(@todo)
    turbo_stream
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    current_user.unlike(@todo)
    turbo_stream
  end
end
