class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.integer :keyword_id
      t.datetime :searched_date
      t.integer :tweet_count

      t.timestamps
    end
  end
end
