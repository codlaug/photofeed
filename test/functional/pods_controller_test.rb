require 'test_helper'

class PodsControllerTest < ActionController::TestCase
  setup do
    @pod = pods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pod" do
    assert_difference('Pod.count') do
      post :create, pod: { id: @pod.id, name: @pod.name }
    end

    assert_redirected_to pod_path(assigns(:pod))
  end

  test "should show pod" do
    get :show, id: @pod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pod
    assert_response :success
  end

  test "should update pod" do
    put :update, id: @pod, pod: { id: @pod.id, name: @pod.name }
    assert_redirected_to pod_path(assigns(:pod))
  end

  test "should destroy pod" do
    assert_difference('Pod.count', -1) do
      delete :destroy, id: @pod
    end

    assert_redirected_to pods_path
  end
end
