json.array!(@searched_tweets) do |searched_tweet|
  json.extract! searched_tweet, :id, :keyword_id, :tweet_id, :tweet_date, :tweet_text, :user_id, :user_screen_name, :user_name, :retweet_count, :favorite_count
  json.url searched_tweet_url(searched_tweet, format: :json)
end
