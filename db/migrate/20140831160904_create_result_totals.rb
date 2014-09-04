class CreateResultTotals < ActiveRecord::Migration
  def change
    create_table :result_totals do |t|
      t.integer :keyword_id
      t.datetime :last_searched_date
      t.integer :max_tweet_id
      t.integer :total_tweet_count

      t.timestamps
    end
  end
end
