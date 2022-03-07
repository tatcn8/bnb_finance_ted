class CreateExpectedIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :expected_incomes do |t|
      t.string :title
      t.string :amount
      t.string :earner
      t.references :future_month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
