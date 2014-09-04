class CreateSearchedTweets < ActiveRecord::Migration
  def change
    create_table :searched_tweets do |t|
      t.integer :keyword_id
      t.integer :tweet_id
      t.datetime :tweet_date
      t.string :tweet_text
      t.integer :user_id
      t.string :user_screen_name
      t.string :user_name
      t.integer :retweet_count
      t.integer :favorite_count

      t.timestamps
    end
  end
end
