class RemoveLastLoginAtFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :last_login_at, :datetime, null: false
  end
end
