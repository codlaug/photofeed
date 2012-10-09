require 'test_helper'

class TwitterMembersControllerTest < ActionController::TestCase
  setup do
    @twitter_member = twitter_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_member" do
    assert_difference('TwitterMember.count') do
      post :create, twitter_member: { description: @twitter_member.description, id: @twitter_member.id, location: @twitter_member.location, name: @twitter_member.name, screen_name: @twitter_member.screen_name, twitter_id: @twitter_member.twitter_id, url: @twitter_member.url }
    end

    assert_redirected_to twitter_member_path(assigns(:twitter_member))
  end

  test "should show twitter_member" do
    get :show, id: @twitter_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @twitter_member
    assert_response :success
  end

  test "should update twitter_member" do
    put :update, id: @twitter_member, twitter_member: { description: @twitter_member.description, id: @twitter_member.id, location: @twitter_member.location, name: @twitter_member.name, screen_name: @twitter_member.screen_name, twitter_id: @twitter_member.twitter_id, url: @twitter_member.url }
    assert_redirected_to twitter_member_path(assigns(:twitter_member))
  end

  test "should destroy twitter_member" do
    assert_difference('TwitterMember.count', -1) do
      delete :destroy, id: @twitter_member
    end

    assert_redirected_to twitter_members_path
  end
end
