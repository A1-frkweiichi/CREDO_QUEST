module UsersHelper
  def default_todos_completion_percentage
    total_default_todos = 50
    completed_default_todos = current_user.todos.default_todos.where(checked: true).count

    (completed_default_todos.to_f / total_default_todos.to_f) * 100
  end
end
