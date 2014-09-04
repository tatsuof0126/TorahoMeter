class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.time :interval
      t.datetime :search_date
      t.integer :max_tweet_id

      t.timestamps
    end
  end
end
