class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  after_create :create_default_todos

  def self.find_or_create_from_auth(auth)
    uid = auth[:uid]
    provider = auth[:provider]
    nickname = auth[:info][:nickname]
    name = auth[:info][:name]
    image = auth[:info][:image]

    self.find_or_create_by(uid: uid, provider: provider) do |user|
      user.nickname = auth[:info][:nickname]
      user.name = auth[:info][:name]
      user.image = auth[:info][:image]
    end
  end

  private

  def create_default_todos
    DEFAULT_TODOS.each_with_index do |(category, description), index|
      description.each_with_index do |description, sub_index|
        todos.create!(category: category, description: description)
      end
    end
  end
end
