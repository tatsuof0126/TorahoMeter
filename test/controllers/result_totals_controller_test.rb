require 'test_helper'

class ResultTotalsControllerTest < ActionController::TestCase
  setup do
    @result_total = result_totals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_totals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_total" do
    assert_difference('ResultTotal.count') do
      post :create, result_total: { keyword_id: @result_total.keyword_id, last_searched_date: @result_total.last_searched_date, max_tweet_id: @result_total.max_tweet_id, total_tweet_count: @result_total.total_tweet_count }
    end

    assert_redirected_to result_total_path(assigns(:result_total))
  end

  test "should show result_total" do
    get :show, id: @result_total
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_total
    assert_response :success
  end

  test "should update result_total" do
    patch :update, id: @result_total, result_total: { keyword_id: @result_total.keyword_id, last_searched_date: @result_total.last_searched_date, max_tweet_id: @result_total.max_tweet_id, total_tweet_count: @result_total.total_tweet_count }
    assert_redirected_to result_total_path(assigns(:result_total))
  end

  test "should destroy result_total" do
    assert_difference('ResultTotal.count', -1) do
      delete :destroy, id: @result_total
    end

    assert_redirected_to result_totals_path
  end
end
