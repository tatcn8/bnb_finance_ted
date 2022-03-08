class AddUserIdToFutureMonths < ActiveRecord::Migration[7.0]
  def change
    add_column :future_months, :user_id, :integer
    add_index :future_months, :user_id
  end
end
