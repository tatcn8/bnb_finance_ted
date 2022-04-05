class AddMonthToMonths < ActiveRecord::Migration[7.0]
  def change
    add_column :months, :month, :string
    add_column :months, :year, :integer
  end
end
