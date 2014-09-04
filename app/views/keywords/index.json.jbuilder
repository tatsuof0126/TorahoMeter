json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :keyword, :interval, :search_date, :max_tweet_id
  json.url keyword_url(keyword, format: :json)
end
