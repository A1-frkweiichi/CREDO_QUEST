class Todo < ApplicationRecord
  belongs_to :user

  scope :default_todos, -> { where(default: true) }
  scope :user_todos, -> { where(default: false) }
end
