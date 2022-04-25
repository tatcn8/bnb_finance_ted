class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.integer :initial_value
      t.integer :goal_value
      t.integer :years_to_save

      t.timestamps
    end
  end
end
