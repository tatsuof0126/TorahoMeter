class RemoveColumnFromKeywords < ActiveRecord::Migration
  def change
    remove_column :keywords, :search_date, :datetime
    remove_column :keywords, :max_tweet_id, :integer
  end
end
