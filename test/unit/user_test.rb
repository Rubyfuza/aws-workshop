require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "creating a user" do
    u = users(:one)
    assert u.save
    assert_equal u, User.find(u.id)
  end
end
