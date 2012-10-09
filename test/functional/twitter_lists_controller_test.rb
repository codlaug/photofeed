require 'test_helper'

class TwitterListsControllerTest < ActionController::TestCase
  setup do
    @twitter_list = twitter_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_list" do
    assert_difference('TwitterList.count') do
      post :create, twitter_list: { id: @twitter_list.id, list_slug: @twitter_list.list_slug, name: @twitter_list.name, owner_screen_name: @twitter_list.owner_screen_name }
    end

    assert_redirected_to twitter_list_path(assigns(:twitter_list))
  end

  test "should show twitter_list" do
    get :show, id: @twitter_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @twitter_list
    assert_response :success
  end

  test "should update twitter_list" do
    put :update, id: @twitter_list, twitter_list: { id: @twitter_list.id, list_slug: @twitter_list.list_slug, name: @twitter_list.name, owner_screen_name: @twitter_list.owner_screen_name }
    assert_redirected_to twitter_list_path(assigns(:twitter_list))
  end

  test "should destroy twitter_list" do
    assert_difference('TwitterList.count', -1) do
      delete :destroy, id: @twitter_list
    end

    assert_redirected_to twitter_lists_path
  end
end
