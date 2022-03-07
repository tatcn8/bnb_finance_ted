class AddStatusToMonths < ActiveRecord::Migration[7.0]
  def change
    add_column :months, :status, :string
  end
end
