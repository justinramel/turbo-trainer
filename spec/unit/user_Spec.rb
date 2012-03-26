require 'spec_helper'

describe User do
  subject { Factory.create(:user) }
  let(:workout) { Factory.create(:workout) }

  it "can have workouts" do
    subject.workouts << workout
    subject.reload.workouts.should == [workout]
  end

end