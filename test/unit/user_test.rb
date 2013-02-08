require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "creating a user" do
    u = users(:one)
    assert u.save
    assert_equal u, User.find(u.id)
  end

  test "relevant chirps" do
    assert users(:one).relevant_chirps.empty?
    
    c1 = users(:one).chirps.create!(:content => "hi")
    assert users(:one).relevant_chirps.include?(c1)

    c2 = users(:two).chirps.create!(:content => "ho")
    assert !users(:one).relevant_chirps.include?(c2)

    users(:one).follow(users(:two))
    assert users(:one).relevant_chirps.include?(c2)
  end
end
