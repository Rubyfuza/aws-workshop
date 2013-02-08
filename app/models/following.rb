class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :following_user, :class_name => "User"

  attr_accessible :following_user

  def self.followers_for_user(user)
    where(:following_user_id => user.id).includes(:user).map(&:user)
  end
end
