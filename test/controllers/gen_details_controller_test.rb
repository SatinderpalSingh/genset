require 'test_helper'

class GenDetailsControllerTest < ActionController::TestCase
  setup do
    @gen_detail = gen_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gen_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gen_detail" do
    assert_difference('GenDetail.count') do
      post :create, gen_detail: { genRent: @gen_detail.genRent, genType: @gen_detail.genType, totalGen: @gen_detail.totalGen }
    end

    assert_redirected_to gen_detail_path(assigns(:gen_detail))
  end

  test "should show gen_detail" do
    get :show, id: @gen_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gen_detail
    assert_response :success
  end

  test "should update gen_detail" do
    patch :update, id: @gen_detail, gen_detail: { genRent: @gen_detail.genRent, genType: @gen_detail.genType, totalGen: @gen_detail.totalGen }
    assert_redirected_to gen_detail_path(assigns(:gen_detail))
  end

  test "should destroy gen_detail" do
    assert_difference('GenDetail.count', -1) do
      delete :destroy, id: @gen_detail
    end

    assert_redirected_to gen_details_path
  end
end
