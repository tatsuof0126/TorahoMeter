# encoding: utf-8
require "twitter"

class SearchController < ApplicationController

  def search    
    #id:tatsuo_app
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "UQoCTcutS1c3usHjLER61o1F4"
      config.consumer_secret     = "jhlcZxcYMPeAaFMOBobZNvHeiGVBpp8Ex9XHWyLcW877DalXmU"
      config.access_token        = "847568904-BpL7hwDLK0vs5eyhPFw07nfH9jq80SqLsGjT5cCA"
      config.access_token_secret = "73cI4Uqi46Jvn9lJiPjJQAX7XS3WVVX1KB4Jk0srbwgym"
    end
    
    keywords = Keyword.all
    
    str = ""
    keywords.each do |keyword|
      resultTotal = ResultTotal.find_by(keyword_id: keyword.id)
      if resultTotal == nil
        resultTotal = ResultTotal.new
        resultTotal.keyword_id = keyword.id
        resultTotal.last_searched_date = DateTime.new(2014, 1, 1)
        resultTotal.max_tweet_id = 0
        resultTotal.total_tweet_count = 0
      end
      
      targetDateTime = resultTotal.last_searched_date + keyword.interval.hour * 60 * 60 + keyword.interval.min * 60       
      if DateTime.current < targetDateTime
        str << "no search -> "
        str << keyword.keyword
        str << "<br><br>"
        next
      end
    
      search_str = ""
      search_str << keyword.keyword
      search_str << " -RT since_id:"
      search_str << (resultTotal.max_tweet_id+1).to_s
      
      now = DateTime.current
      result = client.search(search_str, :result_type => "recent")
    
      str << "search -> "
      str << search_str
      str << "<br><br>"
      
      count = 0
      result.collect do |tweet|
        if tweet.text.include?(keyword.keyword) == false
          next
        end
        
        count += 1
        
        if params[:tweet_store] != "false" 
          searchedTweet = SearchedTweet.new
          searchedTweet.keyword_id = keyword.id
          searchedTweet.tweet_id = tweet.id 
          searchedTweet.tweet_date = tweet.created_at
          searchedTweet.tweet_text = tweet.text
          searchedTweet.user_id = tweet.user.id
          searchedTweet.user_screen_name = tweet.user.screen_name
          searchedTweet.user_name = tweet.user.name
          searchedTweet.retweet_count = tweet.retweet_count
          searchedTweet.favorite_count = tweet.favorite_count
          searchedTweet.save
        end
        
        str << tweet.created_at.to_s
        str << " "
        str << tweet.user.screen_name
        str << " "
        str << tweet.text
        str << "<br><br>"
      end
      
      resultTotal.last_searched_date = now
      resultTotal.max_tweet_id = result.attrs[:search_metadata][:max_id]
      resultTotal.total_tweet_count += count
      resultTotal.save
      
      searchResult = SearchResult.new
      searchResult.keyword_id = keyword.id
      searchResult.searched_date = now
      searchResult.tweet_count = count
      searchResult.save
      
      str << "<br><br>"
    end
        
    render :text => str
  end

end
