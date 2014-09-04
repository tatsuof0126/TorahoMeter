json.array!(@result_totals) do |result_total|
  json.extract! result_total, :id, :keyword_id, :last_searched_date, :max_tweet_id, :total_tweet_count
  json.url result_total_url(result_total, format: :json)
end
