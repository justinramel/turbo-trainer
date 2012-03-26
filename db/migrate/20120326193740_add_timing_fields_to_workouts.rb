class AddTimingFieldsToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :started, :datetime
    add_column :workouts, :finished, :datetime
  end
end
