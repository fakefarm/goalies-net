class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :snooze
      t.string   :name
      t.boolean  :completed, default: false
      t.boolean  :deleted,   default: false
      t.integer  :user_id,   default: 1 # TODO - remove
      t.integer  :goal_id,   default: 1
      t.index    :goal_id
      t.index    :user_id

      t.timestamps
    end
  end
end
