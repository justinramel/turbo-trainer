class AddActualWorkoutDurationToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :actual_duration, :float
  end
end
