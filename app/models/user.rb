class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  after_create :create_default_todos

  def self.find_or_create_from_auth(auth)
    self.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |user|
      user.nickname = auth[:info][:nickname]
      user.name = auth[:info][:name]
      user.image = auth[:info][:image]
    end
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
