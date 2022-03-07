class AddStatusToExpectedExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expected_expenses, :status, :string
  end
end
