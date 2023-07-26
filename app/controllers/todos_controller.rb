class TodosController < ApplicationController
  before_action :set_todo

  def update
    @todo.update(todo_params)
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:checked)
  end
end
