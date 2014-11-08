class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.date    :snooze
      t.string  :name
      t.boolean :completed, default: false
      t.boolean :deleted,   default: false
      t.integer :user_id
      t.integer :goal_id
      t.index   :goal_id

      t.timestamps
    end
  end
end
