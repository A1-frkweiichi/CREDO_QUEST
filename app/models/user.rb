class User < ApplicationRecord
  has_many :todos

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
end
