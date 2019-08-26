class CreateCompletions < ActiveRecord::Migration[5.1]
  def change
    create_table :completions do |t|
      t.integer :habit_id
      t.integer :user_id

      t.timestamps
    end
  end
end
