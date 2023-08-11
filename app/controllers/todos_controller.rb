class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]
  # before_action :set_meta_tags_for_todo, only: [:index]

  def index
    @todos = Todo.user_todos.order(id: :desc).page(params[:page]).per(15)
    @todo = current_user.todos.new(default: false)
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params.merge(default: false))
    if @todo.save
      flash[:notice] = t("flash.todos.new.success")
    else
      flash[:error] = t("flash.todos.new.failure")
    end
    redirect_back(fallback_location: root_path)
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
    if @todo.default == false
      @todo.destroy
      flash.now[:notice] = t("flash.todos.destroy.success")
    else
      flash.now[:error] = t("flash.todos.destroy.failure")
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

  # def set_meta_tags_for_todo
  #   set_meta_tags helpers.default_meta_tags
  #   helpers.todo_meta_tags
  # end
end
