class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :category, null: false
      t.string :description, null: false
      t.boolean :checked, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
