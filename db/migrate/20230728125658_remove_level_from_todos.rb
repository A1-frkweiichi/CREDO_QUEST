class RemoveLevelFromTodos < ActiveRecord::Migration[7.0]
  def change
    remove_column :todos, :level, :integer
  end
end
