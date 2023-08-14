class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]
  before_action :authorize_todo, only: [:update]

  def index
    @q = Todo.user_todos.ransack(params[:q])
    @todos = @q.result.order(id: :desc).page(params[:page]).per(15)
    @todo = current_user.todos.new(default: false) if current_user
  end

  def show
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params.merge(default: false))
    if @todo.save
      flash.now[:notice] = t("flash.todos.new.success")
    else
      flash.now[:error] = t("flash.todos.new.failure")
    end
  end

  def update
    if @todo.update(todo_params)
      flash.now[:notice] = t("flash.todos.update.success")
      update_user_level_and_categories_progress
    else
      flash.now[:error] = t("flash.todos.update.failure")
    end
  end

  def destroy
    if @todo.default == false && @todo.destroy
      flash.now[:notice] = t("flash.todos.destroy.success")
    else
      flash.now[:error] = t("flash.todos.destroy.failure")
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def authorize_todo
    return unless current_user.nil? || @todo.user != current_user

    flash[:alert] = t("flash.todos.authorize_todo.alert")
    redirect_to user_path(@todo.user)
  end

  def todo_params
    params.require(:todo).permit(:category, :description, :checked)
  end

  def update_user_level_and_categories_progress
    @todo.update_user_level
    @categories_progress = @todo.user.categories_progress
  end
end
