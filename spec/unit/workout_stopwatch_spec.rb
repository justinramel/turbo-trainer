require 'date'
require 'workout_stopwatch'
require 'ostruct'

describe WorkoutStopwatch do
  let(:workout) { OpenStruct.new.extend(WorkoutStopwatch) }
  let(:clock) { double('clock') }
  let(:now) { DateTime.parse('2011-09-22T09:56:14') }

  before do
    clock.stub(:now).and_return(now)
  end

  describe "start!" do
    before do
      workout.should_receive(:save).and_return(true)
      @saved = workout.start!(clock)
    end

    it "should record the starting of a workout" do
      workout.started.should == now
    end

    it "should return true" do
      @saved.should == true
    end
  end

  describe "stop! happy path" do
    before do
      workout.should_receive(:save).twice.and_return(true)
      workout.start!(clock)
      @stopped = DateTime.parse('2011-09-22T10:22:15')
      clock.stub(:now).and_return(@stopped)
      @saved = workout.stop!(clock)
    end

    it "should record the stopping of a workout" do
      workout.finished.should == @stopped
    end

    it "should calculate the actual workout time" do
      workout.actual_duration.should == 1561.0
    end

    it "should return true" do
      @saved.should == true
    end
  end

  describe "stop! when no start!" do
    it "should throw WorkoutNotStarted when stopping an un-started workout" do
      expect do
        workout.stop!
      end.should raise_error(WorkoutStopwatch::WorkoutNotStarted)
    end
  end

end