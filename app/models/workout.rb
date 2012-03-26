class Workout < ActiveRecord::Base
  include WorkoutStopwatch

  belongs_to :user
end
