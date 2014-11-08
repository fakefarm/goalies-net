class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text     :body
      t.string   :title
      t.integer  :user_id,   default: 1 # TODO - remove
      t.integer  :goal_id,   default: 1 # TODO - remove
      t.boolean  :deleted,   default: false
      t.index    :goal_id
      t.index    :user_id

      t.timestamps
    end
  end
end
