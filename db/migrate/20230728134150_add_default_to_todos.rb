class AddDefaultToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :default, :boolean, default: false
  end
end
