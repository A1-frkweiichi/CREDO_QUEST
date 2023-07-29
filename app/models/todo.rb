class Todo < ApplicationRecord
  belongs_to :user
  after_save :update_user_level, if: :saved_change_to_checked?

  scope :default_todos, -> { where(default: true) }
  scope :user_todos, -> { where(default: false) }

  def update_user_level
    if checked
      user.level += 1
    else
      user.level -= 1
    end
    user.save
  end
end
