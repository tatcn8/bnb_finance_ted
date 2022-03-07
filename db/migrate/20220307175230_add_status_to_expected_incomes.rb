class AddStatusToExpectedIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :expected_incomes, :status, :string
  end
end
