class User < ApplicationRecord
  after_create :create_default_todos
  has_many :todos, dependent: :destroy
  has_many :likes
  has_many :liked_todos, through: :likes, source: :todo
  has_many :another_website_links, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def liked?(todo)
    likes.exists?(todo_id: todo.id)
  end

  def like(todo)
    likes.create(todo_id: todo.id)
  end

  def unlike(todo)
    likes.find_by(todo_id: todo.id).destroy
  end

  def follow(other_user)
    following << other_user unless self == other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def level
    self.todos.where(checked: true).count
  end

  def categories_progress
    todos.default_todos.order(id: :asc).group_by(&:category).transform_values do |todos|
      checked = todos.count(&:checked)
      total = todos.size
      (checked.to_f / total * 100).round
    end
  end

  def self.find_or_create_from_auth(auth)
    user = self.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |user_record|
      user_record.nickname = auth[:info][:nickname]
      user_record.name = auth[:info][:name]
      user_record.image = auth[:info][:image].gsub("_normal", "")
      user_record.last_login_at = Time.current
    end

    user.assign_attributes(
      nickname: auth[:info][:nickname],
      name: auth[:info][:name],
      image: auth[:info][:image].gsub("_normal", ""),
      last_login_at: Time.current
    )

    user.save if user.changed?
    user
  end

  private

  def create_default_todos
    DEFAULT_TODOS.each do |category, descriptions|
      descriptions.each do |description|
        todos.create!(category: category, description: description, default: true)
      end
    end
  end
end
