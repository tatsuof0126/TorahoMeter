class RemoveColumnFromResultTotal < ActiveRecord::Migration
  def change
    remove_column :result_totals, :keyword_id, :integer
  end
end
