class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :snooze
      t.integer :user_id
      t.integer :goal_id
      t.boolean :completed, default: false
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
