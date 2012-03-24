require "test_helper"

describe "Workout integration" do

  before do
    @user = Factory(:user)
    sign_in(@user)
  end

  it "create workout" do
    visit home_index_path
    click_link "New workout"

    page.body.must_include "Start workout"
  end

end