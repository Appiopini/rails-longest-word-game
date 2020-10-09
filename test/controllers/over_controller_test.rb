require 'test_helper'

class OverControllerTest < ActionDispatch::IntegrationTest
  test "should get game" do
    get over_game_url
    assert_response :success
  end

end
