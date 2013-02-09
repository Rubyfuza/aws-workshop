class User < ActiveRecord::Base
  attr_accessible :email, :login, :name

  has_many :chirps
  has_many :followings

  def followers
    Following.followers_for_user(self)
  end

  def following
    followings.includes(:following_user).map(&:following_user)
  end

  def follow(another_user)
    followings.create(:following_user => another_user)
  end

  def relevant_chirps
    chirps.to_a.concat(following.map(&:chirps).flatten)
  end
end
