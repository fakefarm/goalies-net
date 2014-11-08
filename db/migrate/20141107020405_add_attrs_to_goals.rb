class AddAttrsToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :quarter, :string
    add_column :goals, :completed,  :boolean, default: false
    add_column :goals, :user_id, :integer
    add_column :goals, :deleted, :boolean, default: false
  end
end
