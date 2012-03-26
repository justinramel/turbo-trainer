require 'spec_helper'

describe "Workout integration" do

  before do
    @user = Factory(:user)
    sign_in(@user)
  end

  it "create workout" do
    visit home_index_path
    click_link "New workout"

    page.body.should include("Start workout")

    click_button "Start"

    page.body.should include("Workout started")
  end

end