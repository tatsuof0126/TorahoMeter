class AddKeywordIdToResultTotal < ActiveRecord::Migration
  def change
    add_reference :result_totals, :keyword, index: true
  end
end
