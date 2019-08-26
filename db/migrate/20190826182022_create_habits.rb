class CreateHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :habits do |t|
      t.string :habit_name
      t.integer :user_id
      t.boolean :actively_tracking

      t.timestamps
    end
  end
end
