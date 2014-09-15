class ShowController < ApplicationController

  def standard
    @chart_data = []
    
    keyword_id = params[:keyword].to_i
    if keyword_id == 0
      results = SearchResult.all
    else
      results = SearchResult.where(keyword_id: keyword_id)
    end
    
    beforeDate = nil
    
    results.each do |result|
      if beforeDate != nil
        @chart_data << [formatDate(beforeDate), result.tweet_count]
      end
      beforeDate = result.searched_date      
    end
    
  end
  
  private
    def formatDate(date)
      date.to_s
#      date.strftime("%y/%m/%d %H:%M:%S")
    end
  
end
