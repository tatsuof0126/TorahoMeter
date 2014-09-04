require 'test_helper'

class SearchedTweetsControllerTest < ActionController::TestCase
  setup do
    @searched_tweet = searched_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searched_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create searched_tweet" do
    assert_difference('SearchedTweet.count') do
      post :create, searched_tweet: { favorite_count: @searched_tweet.favorite_count, keyword_id: @searched_tweet.keyword_id, retweet_count: @searched_tweet.retweet_count, tweet_date: @searched_tweet.tweet_date, tweet_id: @searched_tweet.tweet_id, tweet_text: @searched_tweet.tweet_text, user_id: @searched_tweet.user_id, user_name: @searched_tweet.user_name, user_screen_name: @searched_tweet.user_screen_name }
    end

    assert_redirected_to searched_tweet_path(assigns(:searched_tweet))
  end

  test "should show searched_tweet" do
    get :show, id: @searched_tweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @searched_tweet
    assert_response :success
  end

  test "should update searched_tweet" do
    patch :update, id: @searched_tweet, searched_tweet: { favorite_count: @searched_tweet.favorite_count, keyword_id: @searched_tweet.keyword_id, retweet_count: @searched_tweet.retweet_count, tweet_date: @searched_tweet.tweet_date, tweet_id: @searched_tweet.tweet_id, tweet_text: @searched_tweet.tweet_text, user_id: @searched_tweet.user_id, user_name: @searched_tweet.user_name, user_screen_name: @searched_tweet.user_screen_name }
    assert_redirected_to searched_tweet_path(assigns(:searched_tweet))
  end

  test "should destroy searched_tweet" do
    assert_difference('SearchedTweet.count', -1) do
      delete :destroy, id: @searched_tweet
    end

    assert_redirected_to searched_tweets_path
  end
end
