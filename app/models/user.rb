class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  after_create :create_default_todos

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
      user_record.image = auth[:info][:image]
      user_record.last_login_at = Time.current
    end

    user.assign_attributes(
      nickname: auth[:info][:nickname],
      name: auth[:info][:name],
      image: auth[:info][:image],
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
