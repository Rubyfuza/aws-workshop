require 'test_helper'

class ChirpTest < ActiveSupport::TestCase
  def test_create_chirp
    c = Chirp.create! :content => "hellow", :user_id => users(:one).id
    assert_equal users(:one), c.user
    assert users(:one).chirps.include?(c)
  end
end
