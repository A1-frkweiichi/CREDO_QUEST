class Todo < ApplicationRecord
  CATEGORIES = %w[BeOpen MoveFast GiveFirst GeekOut TakeOwnership].freeze

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  scope :default_todos, -> { where(default: true) }
  scope :user_todos, -> { where(default: false) }

  after_save :update_user_level, if: :saved_change_to_checked?

  def self.ransackable_attributes(_auth_object = nil)
    ["category"]
  end

  def update_user_level
    if checked
      user.level += 1
    else
      user.level -= 1
    end
    user.save
  end
end
