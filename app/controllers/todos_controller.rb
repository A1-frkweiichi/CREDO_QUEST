class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.user_todos
  end

  def show
  end

  def new
    @todo = current_user.todos.new(default: false)
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params.merge(default: false))

    if @todo.save
      redirect_to todo_url(@todo), notice: "Todo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      update_user_level_and_categories_progress
      flash.now[:notice] = t("flash.todos.update.success")
    else
      flash.now[:error] = t("flash.todos.update.failure")
    end
  end

  def destroy
    if @todo.default == false
      @todo.destroy
      redirect_to todos_url, notice: "Todo was successfully destroyed."
    else
      redirect_to todos_url, alert: "Not allowed to delete default todos."
    end
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:category, :description, :checked)
  end

  def update_user_level_and_categories_progress
    @todo.update_user_level
    @categories_progress = @todo.user.categories_progress
  end
end
