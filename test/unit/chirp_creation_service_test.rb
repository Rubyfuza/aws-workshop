require 'test_helper'

class ChirpCreationServiceTest < ActiveSupport::TestCase
  def test_creates_a_user
    c = ChirpCreationService.new.create(:content => "hellow", :user_name => "bob")
    assert_equal "hellow", c.content
    assert_not_nil c.user
    assert_equal User.find_by_name("bob"), c.user
  end
end
