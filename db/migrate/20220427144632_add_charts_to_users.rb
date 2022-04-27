class AddChartsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :display_overall, :boolean, null: false, default: true
    add_column :users, :display_last_month, :boolean, null: false, default: true
    add_column :users, :display_income_summary, :boolean, null: false, default: true
  end
end
