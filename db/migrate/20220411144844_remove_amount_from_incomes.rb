class RemoveAmountFromIncomes < ActiveRecord::Migration[7.0]
  def change
    remove_column :incomes, :amount, :string
  end
end
