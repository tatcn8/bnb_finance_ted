class CreateFutureMonths < ActiveRecord::Migration[7.0]
  def change
    create_table :future_months do |t|
      t.string :title

      t.timestamps
    end
  end
end
