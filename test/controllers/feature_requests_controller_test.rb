require 'test_helper'

class FeatureRequestsControllerTest < ActionController::TestCase
  setup do
    @feature_request = feature_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feature_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feature_request" do
    assert_difference('FeatureRequest.count') do
      post :create, feature_request: {  }
    end

    assert_redirected_to feature_request_path(assigns(:feature_request))
  end

  test "should show feature_request" do
    get :show, id: @feature_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feature_request
    assert_response :success
  end

  test "should update feature_request" do
    patch :update, id: @feature_request, feature_request: {  }
    assert_redirected_to feature_request_path(assigns(:feature_request))
  end

  test "should destroy feature_request" do
    assert_difference('FeatureRequest.count', -1) do
      delete :destroy, id: @feature_request
    end

    assert_redirected_to feature_requests_path
  end
end
