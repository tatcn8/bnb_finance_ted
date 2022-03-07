class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.string :title
      t.string :amount
      t.string :earner
      t.references :month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
