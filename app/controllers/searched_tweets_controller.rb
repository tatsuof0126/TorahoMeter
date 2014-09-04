class SearchedTweetsController < ApplicationController
  before_action :set_searched_tweet, only: [:show, :edit, :update, :destroy]

  # GET /searched_tweets
  # GET /searched_tweets.json
  def index
    @searched_tweets = SearchedTweet.all
  end

  # GET /searched_tweets/1
  # GET /searched_tweets/1.json
  def show
  end

  # GET /searched_tweets/new
  def new
    @searched_tweet = SearchedTweet.new
  end

  # GET /searched_tweets/1/edit
  def edit
  end

  # POST /searched_tweets
  # POST /searched_tweets.json
  def create
    @searched_tweet = SearchedTweet.new(searched_tweet_params)

    respond_to do |format|
      if @searched_tweet.save
        format.html { redirect_to @searched_tweet, notice: 'Searched tweet was successfully created.' }
        format.json { render :show, status: :created, location: @searched_tweet }
      else
        format.html { render :new }
        format.json { render json: @searched_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searched_tweets/1
  # PATCH/PUT /searched_tweets/1.json
  def update
    respond_to do |format|
      if @searched_tweet.update(searched_tweet_params)
        format.html { redirect_to @searched_tweet, notice: 'Searched tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @searched_tweet }
      else
        format.html { render :edit }
        format.json { render json: @searched_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searched_tweets/1
  # DELETE /searched_tweets/1.json
  def destroy
    @searched_tweet.destroy
    respond_to do |format|
      format.html { redirect_to searched_tweets_url, notice: 'Searched tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_old_tweets
    day = params[:day].to_i
    if day == 0
      day = 30
    end
    
    targetDay = Date.today - day
    
    # "tweet_date < 'YYYY-MM-DD 09:00'"
    targetStr = "tweet_date < '"
    targetStr << targetDay.to_s
    targetStr << " 09:00'"
    
    SearchedTweet.destroy_all(targetStr)
    render :text => "done."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_searched_tweet
      @searched_tweet = SearchedTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def searched_tweet_params
      params.require(:searched_tweet).permit(:keyword_id, :tweet_id, :tweet_date, :tweet_text, :user_id, :user_screen_name, :user_name, :retweet_count, :favorite_count)
    end
end
