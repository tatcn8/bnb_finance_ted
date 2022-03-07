class CreateExpectedExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expected_expenses do |t|
      t.string :title
      t.string :amount
      t.references :future_month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
