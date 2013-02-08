require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  def test_create_following
    rockstar = users(:one)
    rockstar.save!
    
    stalker = users(:two)
    stalker.save!
    
    stalker.follow(rockstar)
    stalker.save!
    
    assert Following.exists?(:user_id => stalker.id, :following_user_id => rockstar.id)
    assert stalker.following.include?(rockstar)
    assert rockstar.followers.include?(stalker)
  end
end
