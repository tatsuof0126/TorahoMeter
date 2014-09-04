json.array!(@search_results) do |search_result|
  json.extract! search_result, :id, :keyword_id, :searched_date, :tweet_count
  json.url search_result_url(search_result, format: :json)
end
