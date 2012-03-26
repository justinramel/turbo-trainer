require 'date'
require 'time'

module WorkoutStopwatch

  def start!(clock=Time)
    self.started = clock.now
    self.save
  end

  def stop!(clock=Time)
    raise WorkoutNotStarted unless self.started

    self.finished = clock.now
    st = Time.parse(self.started.to_s)
    ft = Time.parse(self.finished.to_s)
    self.actual_duration = ft - st
    self.save
  end

  class WorkoutNotStarted < StandardError
  end

end