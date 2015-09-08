require 'test_helper'

class GenAvailsControllerTest < ActionController::TestCase
  setup do
    @gen_avail = gen_avails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gen_avails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gen_avail" do
    assert_difference('GenAvail.count') do
      post :create, gen_avail: {  }
    end

    assert_redirected_to gen_avail_path(assigns(:gen_avail))
  end

  test "should show gen_avail" do
    get :show, id: @gen_avail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gen_avail
    assert_response :success
  end

  test "should update gen_avail" do
    patch :update, id: @gen_avail, gen_avail: {  }
    assert_redirected_to gen_avail_path(assigns(:gen_avail))
  end

  test "should destroy gen_avail" do
    assert_difference('GenAvail.count', -1) do
      delete :destroy, id: @gen_avail
    end

    assert_redirected_to gen_avails_path
  end
end
