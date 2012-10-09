require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  setup do
    @tweet = tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweet" do
    assert_difference('Tweet.count') do
      post :create, tweet: { display_url: @tweet.display_url, expanded_url: @tweet.expanded_url, id: @tweet.id, media_url: @tweet.media_url, media_url_https: @tweet.media_url_https, source: @tweet.source, text: @tweet.text, twitter_create_at: @tweet.twitter_create_at, twitter_id: @tweet.twitter_id, url: @tweet.url }
    end

    assert_redirected_to tweet_path(assigns(:tweet))
  end

  test "should show tweet" do
    get :show, id: @tweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweet
    assert_response :success
  end

  test "should update tweet" do
    put :update, id: @tweet, tweet: { display_url: @tweet.display_url, expanded_url: @tweet.expanded_url, id: @tweet.id, media_url: @tweet.media_url, media_url_https: @tweet.media_url_https, source: @tweet.source, text: @tweet.text, twitter_create_at: @tweet.twitter_create_at, twitter_id: @tweet.twitter_id, url: @tweet.url }
    assert_redirected_to tweet_path(assigns(:tweet))
  end

  test "should destroy tweet" do
    assert_difference('Tweet.count', -1) do
      delete :destroy, id: @tweet
    end

    assert_redirected_to tweets_path
  end
end
