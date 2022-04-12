class ChangingMonthToIntegers < ActiveRecord::Migration[7.0]
  def change
    remove_column :months, :month, :string
    add_column :months, :month, :integer
  end
end
