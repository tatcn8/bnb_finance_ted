class RemoveTitleFromMonths < ActiveRecord::Migration[7.0]
  def change
    remove_column :months, :title, :string
  end
end
