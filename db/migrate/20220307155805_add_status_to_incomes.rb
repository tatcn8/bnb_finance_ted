class AddStatusToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :status, :string
  end
end
