class AddUserIdToMonths < ActiveRecord::Migration[7.0]
  def change
    add_column :months, :user_id, :integer
    add_index :months, :user_id
  end
end
