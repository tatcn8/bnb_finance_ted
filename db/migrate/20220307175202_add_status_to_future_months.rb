class AddStatusToFutureMonths < ActiveRecord::Migration[7.0]
  def change
    add_column :future_months, :status, :string
  end
end
