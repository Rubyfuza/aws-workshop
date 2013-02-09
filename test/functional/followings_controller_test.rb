require 'test_helper'

class FollowingsControllerTest < ActionController::TestCase
  test "should create a following and redirect to the followed users page" do
    user = User.create(:name => "to-be-followed")
    follower = User.create(:name => "super-stalker")
    assert !user.followers.include?(follower)

    post :create, :user => user.name, :follower => follower.name
    assert user.followers.include?(follower)
    assert_redirected_to user_chirps_path(:name => user.name)
  end

end
