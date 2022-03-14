class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.integer :initial_balance
      t.integer :years

      t.timestamps
    end
  end
end
