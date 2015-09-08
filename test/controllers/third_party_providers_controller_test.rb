require 'test_helper'

class ThirdPartyProvidersControllerTest < ActionController::TestCase
  setup do
    @third_party_provider = third_party_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:third_party_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create third_party_provider" do
    assert_difference('ThirdPartyProvider.count') do
      post :create, third_party_provider: { address: @third_party_provider.address, contactNo: @third_party_provider.contactNo, name: @third_party_provider.name }
    end

    assert_redirected_to third_party_provider_path(assigns(:third_party_provider))
  end

  test "should show third_party_provider" do
    get :show, id: @third_party_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @third_party_provider
    assert_response :success
  end

  test "should update third_party_provider" do
    patch :update, id: @third_party_provider, third_party_provider: { address: @third_party_provider.address, contactNo: @third_party_provider.contactNo, name: @third_party_provider.name }
    assert_redirected_to third_party_provider_path(assigns(:third_party_provider))
  end

  test "should destroy third_party_provider" do
    assert_difference('ThirdPartyProvider.count', -1) do
      delete :destroy, id: @third_party_provider
    end

    assert_redirected_to third_party_providers_path
  end
end
