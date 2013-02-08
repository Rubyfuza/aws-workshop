require 'test_helper'

class ChirpsControllerTest < ActionController::TestCase
  setup do
    @chirp = chirps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chirps)
  end

  test "should create chirp" do
    assert_difference('Chirp.count') do
      post :create, chirp: { content: @chirp.content, user: @chirp.user }
    end

    assert_redirected_to chirp_path(assigns(:chirp))
  end
end
