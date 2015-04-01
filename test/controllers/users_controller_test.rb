require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get pending" do
    get :pending
    assert_response :success
  end

end
