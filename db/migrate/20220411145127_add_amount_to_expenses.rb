class AddAmountToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :amount, :integer
  end
end
