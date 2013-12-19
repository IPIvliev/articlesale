require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get signup_client" do
    get :signup_client
    assert_response :success
  end

  test "should get signup_copy" do
    get :signup_copy
    assert_response :success
  end

end
