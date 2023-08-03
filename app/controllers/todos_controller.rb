class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def update
    if @todo.update(todo_params)
      @todo.update_user_level
      @categories_progress = @todo.user.categories_progress
      flash.now[:notice] = t("flash.todos.update.success")
    else
      flash.now[:error] = t("flash.todos.update.failure")
    end
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:checked)
  end
end
