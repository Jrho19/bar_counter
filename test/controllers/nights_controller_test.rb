require 'test_helper'

class NightsControllerTest < ActionController::TestCase
  setup do
    @night = nights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create night" do
    assert_difference('Night.count') do
      post :create, night: { count: @night.count, status: @night.status }
    end

    assert_redirected_to night_path(assigns(:night))
  end

  test "should show night" do
    get :show, id: @night
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @night
    assert_response :success
  end

  test "should update night" do
    patch :update, id: @night, night: { count: @night.count, status: @night.status }
    assert_redirected_to night_path(assigns(:night))
  end

  test "should destroy night" do
    assert_difference('Night.count', -1) do
      delete :destroy, id: @night
    end

    assert_redirected_to nights_path
  end
end
