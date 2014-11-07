class AddQuarterToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :quarter, :string
  end
end
