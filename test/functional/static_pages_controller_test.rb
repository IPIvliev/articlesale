require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get articles" do
    get :articles
    assert_response :success
  end

end
