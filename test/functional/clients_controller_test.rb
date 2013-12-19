require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

end
