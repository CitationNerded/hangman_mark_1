require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get game_start_url
    assert_response :success
  end

end
